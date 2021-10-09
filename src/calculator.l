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

"+" 	return PLUS;
"-" 	return MINUS;
"*" 	return TIMES;
"/" 	return DIVIDE;
"^" 	return POW;
"%"		return MODULUS;
"(" 	return LEFT;
")" 	return RIGHT;
"\n"	return EOL;
.      	yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
