%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char *);
%}

%require "3.5"

%token  EOL
%token 	NUMBER
%token 	LEFT RIGHT
%token 	PLUS MINUS TIMES DIVIDE
%token	SQRT MODULUS POW
%token  TAN COS SIN

%left   NEG
%left	PLUS MINUS TIMES DIVIDE

%%

program:
	program expr EOL { printf("Result: %d\n", $2); }
	|
  	;
expr:
	NUMBER						{ $$ =	$1;	}
	|	MINUS expr %prec NEG 	{ $$ = -$2; }
	|	LEFT expr RIGHT			{ $$ = $2;	}
	| 	expr PLUS expr 			{ $$ = $1 + $3; }
  	| 	expr MINUS expr 		{ $$ = $1 - $3; }
  	| 	expr TIMES expr 		{ $$ = $1 * $3; }
  	| 	expr DIVIDE expr 		{ $$ = $1 / $3; }
	| 	expr MODULUS expr 		{ $$ = $1 % $3; }
	|	expr POW expr 			{ $$ = pow($1,$3); }
	|	SQRT LEFT expr RIGHT	{ $$ = sqrt($3); }
    |   TAN LEFT expr RIGHT     { $$ = tan($3);}
    |   COS LEFT expr RIGHT     { $$ = cos($3); }
    |   SIN LEFT expr RIGHT     { $$ = (cos($3)*tan($3)); }
	;

%%

void yyerror(char *s) {
	printf("%s\n", s);
}

extern int yylex();
extern int yyparse();

int main() {
	printf("\nInsert any arithmetic expression\n");
	printf("\033[0;34m");
	printf("NOTE:");
	printf("\033[0m");
	printf("\033[0;32m");
	printf("negative numbers and parentheses are allowed\n");
	printf("\033[0m");
    printf("\e[1;35m");
	printf("you can use following operations: \n");
    printf("\e[1;35m");
    printf("\e[1;33m");
	printf("add = n+n\n");
	printf("subtract = n-n\n");
	printf("multiply = n*n\n");
	printf("divide = n/n\n");
	printf("pow = n^n\n");
	printf("sqrt = sqrt(n)\n");
    printf("\e[1;33m");
    printf("\e[1;31m");
	yyparse();
}
