%{
	#include <stdlib.h>
	#include "y.tab.h"
	void yyerror(char *);
%}

white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%

{white} { }
{real} { yylval=atof(yytext);
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
"sqrt"	return SQRT;
.      	yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
