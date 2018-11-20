/* Mini Calculator */
/* calc.y */

%{
#include "heading.h"

int yyerror(char *s);
int yylex(void);

%}

%union{
  int		int_val;
  string*	op_val;
}

%start	program 
/*
%token	<int_val>	INTEGER_LITERAL
%type	<int_val>	exp
%left	PLUS
%left	MULT 
*/
%type	<int_val>	exp 

%token	<int_val> NUM_TOKEN
%token	IF_TOKEN
%token	THEN_TOKEN
%token	BEGIN_TOKEN
%token	END_TOKEN
%token	PROGRAM_TOKEN
%token	CONST_TOKEN
%token	VAR_TOKEN
%token	WHILE_TOKEN
%token	READ_TOKEN
%token	WRITE_TOKEN
%token	DO_TOKEN
%token	ID_TOKEN
%token	PLUS_TOKEN
%token	MINUS_TOKEN
%token	MULT_TOKEN
%token	DIV_TOKEN
%token	INF_TOKEN
%token	SUP_TOKEN
%token	EG_TOKEN
%token	AFF_TOKEN
%token	INFEG_TOKEN
%token	SUPEG_TOKEN
%token	PV_TOKEN
%token	PT_TOKEN
%token	PO_TOKEN
%token	PF_TOKEN
%token	DIFF_TOKEN
%token VI_TOKEN
%token	ERREUR_TOKEN

%%

/*
input:		/* empty */
/*		| exp	{ cout << "Result: " << $1 << endl; }
		;*/


program:        PROGRAM_TOKEN ID_TOKEN PV_TOKEN block PT_TOKEN;

block:  	declaration BEGIN_TOKEN  END_TOKEN;

vid: 		ID_TOKEN ;

declaration:    VAR_TOKEN  vid PV_TOKEN;





/*		
exp:		NUM_TOKEN	{ $$ = $1; }
		| exp PLUS_TOKEN exp	{ $$ = $1 + $3; }
		| exp MULT_TOKEN exp	{ $$ = $1 * $3; }
		;
*/
%%

int yyerror(string s)
{
  extern int yylineno;	// defined and maintained in lex.c
  extern char *yytext;	// defined and maintained in lex.c
  
  cerr << "ERROR: " << s << " at symbol \"" << yytext;
  cerr << "\" on line " << yylineno << endl;
  exit(1);
}
int yyerror(char *s)
{
  return yyerror(string(s));
}



