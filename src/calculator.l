%{
	#include <stdlib.h>
	#include "y.tab.h"
	void yyerror(char *);
%}

%%

[-+*/%\n]	return *yytext;
[0-9]+	{
					yylval = atoi(yytext);
          return NUMBER;
        }
"("			return LEFT;
")"			return RIGHT;
END 			return '\n';
PLUS      return '+';
MINUS     return '-';
MULTIPLY  return '*';
DIVIDE    return '/';
MODULUS		return '%';
POWER 		return '^';
[ \t] ;
.        	yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
