%{
		#define YYSTYPE double
		#include <stdlib.h>
		#include "y.tab.h"
		void yyerror(char *);
%}

%%
[ \t];
[0-9]+ 	{
					yylval = atoi(yytext);
					return NUMBER;
				}
PLUS        return '+';
MINUS       return '-';
MULTIPLY    return '*';
TIMES       return '*';
DIVIDE      return '/';
[-+*/\n]    return *yytext;
.   yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
