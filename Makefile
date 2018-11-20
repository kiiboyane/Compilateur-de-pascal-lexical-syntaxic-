# Makefile

OBJS	= bison.o lex.o main.o

CC	= gcc
CFLAGS	= 

outp:		$(OBJS)
		$(CC) $(CFLAGS) $(OBJS) -o outp -lfl

lex.o:		lex.c
		$(CC) $(CFLAGS) -c lex.c -o lex.o

lex.c:		lexical.lex 
		flex lexical.lex
		cp lex.yy.c lex.c

bison.o:	bison.c
		$(CC) $(CFLAGS) -c bison.c -o bison.o

bison.c:	syntaxic.y
		bison -d -v syntaxic.y
		cp syntaxic.tab.c bison.c
		cmp -s syntaxic.tab.h tok.h || cp syntaxic.tab.h tok.h

main.o:		main.c
		$(CC) $(CFLAGS) -c main.c -o main.o

lex.o yac.o main.o	: heading.h
lex.o main.o		: tok.h

clean:
	rm -f *.o *~ lex.c lex.yy.c bison.c tok.h syntaxic.tab.c syntaxic.tab.h syntaxic.output outp


