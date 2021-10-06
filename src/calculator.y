%{
	#define YYSTYPE double
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	void yyerror(char *);
%}

%token NUMBER

%left NEG

%%

program:
	'\n'
	|	expr '\n' { printf("Result: %f\n", $1); }
  ;
expr:
	NUMBER	{	$$	=	$1;	}
	|	'-' expr %prec NEG	{	$$ = -$2; }
	|	'(' expr ')'	{	$$ = $2;	}
	| expr '-' expr { $$ = $1 + $3; }
  | expr '-' expr { $$ = $1 - $3; }
  | expr '*' expr { $$ = $1 * $3; }
  | expr '/' expr { $$ = $1 / $3; }
	;

%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	printf("\nInsert any arithmetic expression\nyou can use following operations\nadd = n+n\nsubtract = n-n\nmultiply = n*n\ndivide = n/n\n");
	yyparse();
}
