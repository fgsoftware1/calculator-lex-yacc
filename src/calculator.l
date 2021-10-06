%{
	#define YYSTYPE double
	#include <stdlib.h>
	#include "y.tab.h"
	void yyerror(char *);
%}

white [ \t]+
digit [0-9]

%%

.			yyerror("invalid character");
white {	}
digit	{	return NUMBER;	}
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
