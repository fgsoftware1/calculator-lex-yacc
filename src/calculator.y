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

%start program expr
%%

program:
	program expr '\n' { printf("%d\n", $2); }
  |
  ;
expr:
	NUMBER	{$$=$1;}
	|	expr PLUS	expr{$$=$1+$3;}
	|	expr MINUS	expr{$$=$1-$3;}
	|	expr TIMES	expr{$$=$1*$3;}
	|	expr DIVIDE expr{$$=$1/$3;}
	;

%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}

int main(void) {
	printf("\nInsert any arithmetic expression\nyou can use following operations\nadd = n+n\nsubtract = n-n\nmultiply = n*n\ndivide = n\n");
	yyparse();
	return 0;
}
