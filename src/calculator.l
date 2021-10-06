%{
		#define YYSTYPE double
		#include <stdlib.h>
		#include "y.tab.h"
%}

white	[ \t]+
digit [0-9]

%%

[0-9]+ 	{
					yylval = atoi(yytext);
					return NUMBER;
				}
.   return yytext[0];
