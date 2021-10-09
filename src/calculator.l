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
LEFT		return '(';
RIGHT		return ')';
EOF 		return '\n';
PLUS		return '+';
MINUS   return '-';
"*"  		return MULTIPLY;
"/"     return DIVIDE;
"%"			return MODULUS;
"^" 		return POW;
.      	yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
