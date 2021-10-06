%{
	#define YYSTYPE double
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
%}

%token NUMBER
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token LEFT
%token RIGHT
%token END

%start line
%%

program:
	program expr '\n' { printf("%d\n", $2); }
  |
  ;
expr:
	NUMBER	{$$=$1;}
	|	Expression PLUS	Expression{$$=$1+$3;}
	|	Expression MINUS	Expression{$$=$1-$3;}
	|	Expression TIMES	Expression{$$=$1*$3;}
	|	Expression DIVIDE Expression{$$=$1/$3;}
	;

%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}

int main(void) {
yyparse();
	return 0;
}
