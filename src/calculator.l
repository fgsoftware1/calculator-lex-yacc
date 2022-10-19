%option noyywrap

%{
	#include <stdlib.h>
	#include "y.tab.h"
    #define YYSTYPE double
	void yyerror(char *);
%}

number [0-9]+\.?|[0-9]*\.[0-9]+
white [ \t]+

%%

{white} { }
{number} { yylval=atof(yytext);
	return NUMBER;
}

"\n"	return EOL;
"(" 	return LEFT;
")" 	return RIGHT;
"+" 	return PLUS;
"-" 	return MINUS;
"*" 	return TIMES;
"/" 	return DIVIDE;
"^" 	return POW;
"%"		return MODULUS;
"sqrt"	return SQRT;
"tan"   return TAN;
"cos"   return COS;
"sin"   return SIN;
.      	yyerror("invalid character");

%%
