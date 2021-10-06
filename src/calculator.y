%{
	#define YYSTYPE double
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	void yyerror(char *);
%}

%token NUMBER
%token END
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE
%token LEFT
%token RIGHT

%left PLUS
%left MINUS
%left MULTIPLY
%left DIVIDE
%left NEG

%%

program:
	END
	|	expr END { printf("Result: %f\n", $1; }
  ;
expr:
	NUMBER	{	$$	=	$1;	}
	|	MINUS expr %prec NEG	{	$$ = -$2; }
	|	LEFT expr RIGHT	{	$$ = $2;	}
	| expr PLUS expr { $$ = $1 + $3; }
  | expr MINUS expr { $$ = $1 - $3; }
  | expr MULTIPLY expr { $$ = $1 * $3; }
  | expr DIVIDE expr { $$ = $1 / $3; }
	;

%%

int yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	printf("\nInsert any arithmetic expression\nyou can use following operations\nadd = n+n\nsubtract = n-n\nmultiply = n*n\ndivide = n/n\n");
	yyparse();
}
