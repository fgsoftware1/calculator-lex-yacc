%{
	#define YYSTYPE double
	#include <stdlib.h>
	#include "y.tab.h"
%}

white [ \t]+
digit [0-9]
integer	{digit}+
exponent [eE] [+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%

{white} {	}
{real}	{	yylval = atof(yytext);
	return NUMBER;
}
"\n": return END;
"(": return LEFT;
")": return RIGHT;
"+": return PLUS;
"-": return MINUS;
"*": return MULTIPLY;
"/": return DIVIDE;

%%

int yywrap(void) {
  return 1;
}
