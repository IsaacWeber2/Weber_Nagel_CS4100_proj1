%{
//*****************************************************************************************
// File: cmos.l
// Purpose: Tokenize one student code submission
// build instructions
// flex cmos.l
// g++ -o PlagiarismDetector lex.yy.x
// ./PlagiarismDetector < data_file.txt
// ****************************************************************************************

//declarations

#include <iostream>

using namespace std;

//define things here

#define VARIABLE 1
#define FUNCTION 2
#define OPERATOR 3
#define BASIC 4

#define TKUNMATCHED 255

int linecount = 1;
int variable_count = 1;
int function_count = 1;




%}

D [0-9]
OD [0-9Xx#*$]
L [a-zA-Z_]

/* ignoring whitespace and comments */
WS          [ \t\n]+
COMMENT     "//".*
MULTICOMMENT "/\*"([^*]|\*+[^*/])*\*+\/"


%%

{WS}            { /* Ignore whitespace */ }
{COMMENT}       { /* Ignore comments */ }
{MULTICOMMENT}  { /* Ignore multi-line comments */ }


"+"    {return OPERATOR;}
"%"    {return OPERATOR;}
"-"    {return OPERATOR;}
"/"   {return OPERATOR;}
"*"   {return OPERATOR;}


.							{ 	//unmatched
								return TKUNMATCHED;
							}



%%

int yywrap(){
	return true;
}

int main() {
	int token = 0;
	token = yylex();
	while(token){
		switch (token) {
			case OPERATOR:
				cout << "<Operator: " << yytext << " > " << endl;
				break;
      case FUNCTION:
        cout << "<Function: " << function_count << " " << yytext << " > " endl;
        function_count++;
        break;
	}
		token = yylex();
}	
}