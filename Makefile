.PHONY: all
all: y.tab.c ./lex.yy.c ./calculator

y.tab.c: ./src/calculator.y
	bison -d calculator.y -o $@

./lex.yy.c: ./src/calculator.l
	flex calculator.l

./calculator: y.tab.c lex.yy.c
	gcc -o $@ lex.yy.c y.tab.c -lfl -lm
