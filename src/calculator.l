%{
		#define YYSTYPE double
		#include <stdlib.h>
		#include "y.tab.h"
		extern int yylval;
%}

white	[ \t]+
digit [0-9]

%%

[0-9]+ 	{
					yylval = atoi(yytext);
					return NUMBER;
				}
[\t] ;
.   return yytext[0];

%%

int yywrap(void) {
		return 1;
}
