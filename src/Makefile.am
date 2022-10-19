.PHONY: all
all: y.tab.c ../lex.yy.c ../calculator

y.tab.c: calculator.y
	bison -d calculator.y -o $@

../lex.yy.c: calculator.l
	flex calculator.l

../calculator: y.tab.c lex.yy.c
	gcc -o $@ lex.yy.c y.tab.c -lfl -lm