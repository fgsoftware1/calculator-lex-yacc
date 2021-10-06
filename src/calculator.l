%{
		#define YYSTYPE double
		#include <stdlib.h>
		#include "y.tab.h"
		void yyerror(char *);
%}

white	[ \t]+
digit [0-9]
PLUS        return '+';
MINUS       return '-';
MULTIPLY    return '*';
TIMES       return '*';
DIVIDE      return '/';
.           yyerror("invalid character");

%%
white	{}
[0-9]+ 	{
					yylval = atoi(yytext);
					return NUMBER;
				}
.   return yytext[0];

%%

int yywrap(void) {
  return 1;
}
