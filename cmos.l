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

