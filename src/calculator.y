%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	void yyerror(char *);
%}

%token	EOL
%token 	NUMBER
%token 	LEFT RIGHT
%token 	POW
%token	MODULUS
%token 	PLUS MINUS
%token 	TIMES DIVIDE

%left	PLUS MINUS
%left TIMES DIVIDE
%left	NEG

%right POWER

%%

program:
	program expr EOL { printf("Result: %d\n", $2); }
	|
  ;
expr:
	NUMBER	{	$$	=	$1;	}
	|	MINUS expr %prec NEG { $$ = -$2; }
	|	LEFT expr RIGHT	{	$$ = $2;	}
	| expr PLUS expr { $$ = $1 + $3; }
  | expr MINUS expr { $$ = $1 - $3; }
  | expr TIMES expr { $$ = $1 * $3; }
  | expr DIVIDE expr { $$ = $1 / $3; }
	|	expr POW expr { $$ = pow($1,$3); }
	|	expr MODULUS expr { $$ = $1 % $3; }
	;

%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	printf("\nInsert any arithmetic expression\n
	you can use following operations\n
	NOTE: negative numbers are allowed\n
	add = n+n\n
	subtract = n-n\n
	multiply = n*n\n
	divide = n/n\n
	mod = n%n\n
	pow = n^n");
	yyparse();
}
