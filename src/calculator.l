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
LEFT			return '(';
RIGHT			return ')';
END 			return '\n';
PLUS      return '+';
MINUS     return '-';
MULTIPLY  return '*';
DIVIDE    return '/';
MODULuS		return '%';
[ \t] ;
.        	yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}
