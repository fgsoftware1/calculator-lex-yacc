%{
	#include <stdlib.h>
	#include "y.tab.h"
	void yyerror(char *);
%}

%%

[-+*/%\n]	return *yytext;
[ \t] { ; }
[0-9]+	{
					yylval = atoi(yytext);
          return NUMBER;
        }
"("			return LEFT;
")"			return RIGHT;
"\n" 		return EOF;
"+"     return PLUS;
"-"     return MINUS;
"*"  		return MULTIPLY;
"/"     return DIVIDE;
"%"			return MODULUS;
"^" 		return POW;
.        	yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
