%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}

%token NUMBER
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE

%left PLUS
%left MINUS
%left MULTIPLY
%left DIVIDE
%left NEG

%%

program:
	END
	program expr END { printf("%d\n", $2); }
  |
  ;
expr:
	NUMBER	{	$$	=	$1;	}
	| expr PLUS expr { $$ = $1 + $3; }
  | expr MINUS expr { $$ = $1 - $3; }
  | expr MULTIPLY expr { $$ = $1 * $3; }
  | expr DIVIDE expr { $$ = $1 / $3; }
	;

%%

void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}

int main(void) {
	printf("\nInsert any arithmetic expression\nyou can use following operations\nadd = n+n\nsubtract = n-n\nmultiply = n*n\ndivide = n/n\n");
	yyparse();
	return 0;
}
