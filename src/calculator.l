%{
	#include <stdlib.h>
	#include "y.tab.h"
%}

white [ \t]+
digit [0-9]

%%

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
