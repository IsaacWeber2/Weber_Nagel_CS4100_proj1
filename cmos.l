%{
//*****************************************************************************************
// File: cmos.l
// Purpose: Tokenize one student code submission
// build instructions
// flex cmos.l
// make
// g++ -o PlagiarismDetector lex.yy.c
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
#define EXTRA 5
#define IGNORE 6

#define TKUNMATCHED 255

int linecount = 1;
int variable_count = 1;
int function_count = 1;




%}

D [0-9]
L [a-zA-Z_]
ALL L|" "

TYPE int|float|long|char|double|bool|signed|unsigned|short

/* ignoring whitespace and comments */
WS          [ \t\n]+
COMMENT     "//".*
MULTICOMMENT "/*"([^*]|\*+[^*/])*\*+"/"
VARIABLE    {TYPE}[ \t]+[a-zA-Z_][a-zA-Z0-9_]*[ \t]*(\([^\)]*\))?[ \t]*(\[[0-9]+\])?[ \t]*(=[^;]+)?[ \t]*;
FUNCTION    {TYPE}[ \t]+[a-zA-Z_][a-zA-Z0-9_]*[ \t]*\([^\)]*\*\)?[ \t]*(\{)?[ \t]*;
OPERATOR   [-+=*/%><!&|^]=?|&&|\|\||[?~:;,\.];
BASIC       [a-zA-Z_][a-zA-Z0-9_]*|[0-9]+|[(){}[\]]
IGNORE      . 
%%

{WS}            { /* Ignore whitespace */ }
{COMMENT}       { /* Ignore comments */ }
{MULTICOMMENT}  { return EXTRA; }
{VARIABLE}      { return VARIABLE; }
{FUNCTION}      { return FUNCTION; }
{OPERATOR}      { return OPERATOR; }
{BASIC}         { return BASIC; }
{IGNORE}        { /* Ignore everything else */ }



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
				cout << "<Function: " << function_count << " " << yytext << " > " << endl;
				function_count++;
				break;
			case VARIABLE:
				cout << "<Variable: " << variable_count << " > " << endl;
				variable_count++;
				break;
			case BASIC:
				//cout << "Basic: " << yytext << " > " << endl;
				break;
			default:
				cout << "<Unmatched Token>" << endl;
				break;

}	
			token = yylex();
}
return 0;
}