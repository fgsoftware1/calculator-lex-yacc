%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	void yyerror(char *);
%}

%token NUMBER
%token EOL
%token POW
%token LEFT RIGHT
%token PLUS MINUS
%token MULTIPLY DIVIDE

%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

program:
	program expr EOL { printf("Result: %d\n", $2); }
	|
  ;
expr:
	NUMBER	{	$$	=	$1;	}
	|	LEFT expr RIGHT	{	$$ = $2;	}
	| expr PLUS expr { $$ = $1 + $3; }
  | expr MINUS expr { $$ = $1 - $3; }
  | expr MULTIPLY expr { $$ = $1 * $3; }
  | expr DIVIDE expr { $$ = $1 / $3; }
	|	expr POW expr { $$ = pow($1,$3); }
	|	expr '%' expr { $$ = $1 % $3; }
	;

%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	printf("\nInsert any arithmetic expression\nyou can use following operations\nadd = n+n\nsubtract = n-n\nmultiply = n*n\ndivide = n/n\n");
	yyparse();
}
