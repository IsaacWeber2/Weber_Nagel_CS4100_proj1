%{
#include <iostream>
using namespace std;

// Define any necessary functions or variables here
%}

// Defining token types
%token INTEGER_LITERAL
%token IDENTIFIER
%token OPERATOR
%token KEYWORD
%token PUNCTUATION
%token FLOAT_LITERAL

// Define rules for whitespace and comments
WS      [ \t\n]+
COMMENT "//".*

//keyword rules
IF  "if"
ELSE  "else"
FOR   "for"
WHILE   "while"


//operator rules
EQUAL   "="
PLUS    "+"
MINUS   "-"
MULTIPLY  "*"
DIVIDE  "/"

//puncuation rules
SEMICOLON   ";"
PERIOD    "."
COMMA   ","

// identifiers and literals
DIGIT       [0-9]
LETTER      [a-zA-Z]
INT_LITERAL {DIGIT}+
FLOAT_LITERAL   {DIGIT}+"."{DIGIT}+
ID          {LETTER}({LETTER}|{DIGIT})*

//mathcing tokens

%%
{WS}        { /* Ignore whitespace */ }
{COMMENT}   { /* Ignore comments */ }


%%

int main() {
  yylex(); //runs lexer
  return 0;
}