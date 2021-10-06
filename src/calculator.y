%{
	#define YYSTYPE double
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
%}

%token NUMBER

%%

program:
	program expr '\n' { printf("%d\n", $2); }
  |
  ;
expr:
	NUMBER	{	$$	=	$1;	}
	|	expr '+'	expr{	$$	=	$1	+	$3;	}
	|	expr '-'	expr{	$$	=	$1	-	$3;	}
	|	expr '*'	expr{	$$	=	$1	*	$3;	}
	|	expr '/' expr{	$$	=	$1	/	$3;	}
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
