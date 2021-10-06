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

line:
	END
  |	Expression END {printf("Result:	%f\n", $1);}
	;
Expression:
	NUMBER	{$$=$1;}
	|	Expression PLUS	Expression{$$=$1+$3;}
	|	Expression MINUS	Expression{$$=$1-$3}
	|	Expression TIMES	Expression{$$=$1*$3}
	|	Expression DIVIDE Expression{$$=$1/$3}

%%

void main() {
  printf("\nInsert any arithmetic expression\nyou can use following operations\nadd = n+n\nsubtract = n-n\nmultiply = n*n\ndivide = n/n");
  yyparse();
}

void yyerror() {
  printf("\nentered expression is invalid");
}
