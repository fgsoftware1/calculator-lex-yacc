%{
		#define YYSTYPE double
		#include <stdlib.h>
		#include "y.tab.h"
		void yyerror(char *);
%}

%%

[0-9]+	{ yylval = atoi(yytext);
          return NUMBER;
        }
[-+*/\n]	return *yytext;
PLUS      return '+';
MINUS     return '-';
MULTIPLY  return '*';
TIMES     return '*';
DIVIDE    return '/';
[ \t]	;
.      		yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
