%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	#define YYSTYPE double
    YYSTYPE last_value = 0;
	extern int yylex(void);
	void yyerror(char *);
%}

%require "3.5"

%token	EOL
%token 	NUMBER
%token 	LEFT RIGHT
%token 	POW
%token 	PLUS MINUS
%token 	TIMES DIVIDE
%token	SQRT

%left	PLUS MINUS
%left 	TIMES DIVIDE
%left	NEG

%left   SQRT
%right POW

%%

program:
	program expr EOL { printf("Result: %d\n", $2); }
	|
  ;
expr:
	NUMBER	{ $$ =	$1;	}
	|	MINUS expr %prec NEG { $$ = -$2; }
	|	LEFT expr RIGHT		{ $$ = $2;	}
	| 	expr PLUS expr 		{ $$ = $1 + $3; }
  	| 	expr MINUS expr 	{ $$ = $1 - $3; }
  	| 	expr TIMES expr 	{ $$ = $1 * $3; }
  	| 	expr DIVIDE expr 	{ $$ = $1 / $3; }
	|	expr POW expr 		{ $$ = pow($1,$3); }
	|	SQRT term 			{ $$ = sqrt($2); }
	;

term:     
    |	EOL        		{ $$ = last_value; }
    |   LEFT expr RIGHT	{ $$ = $2;         }
    ;

%%

void yyerror(char *s) {
	printf("%s\n", s);
}

int main() {
	printf("\nInsert any arithmetic expression\n");
	printf("\033[0;34m");
	printf("NOTE:");
	printf("\033[0m");
	printf("\033[0;32m");
	printf("negative numbers are allowed\n");
	printf("\033[0m");
	printf("you can use following operations: \n");
	printf("add = n+n\n");
	printf("subtract = n-n\n");
	printf("multiply = n*n\n");
	printf("divide = n/n\n");
	printf("pow = n^n\n");
	printf("sqrt = sqrt(n)\n");
	yyparse();
}
