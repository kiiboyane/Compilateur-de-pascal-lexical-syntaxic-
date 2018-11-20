/* Mini Calculator */
/* calc.y */

%{
#include "heading.h"

int yyerror(const char *s);
int yylex(void);

%}
/*
%union{
  int		int_val;
  string*	op_val;
}
*/
%start	program 
/*
%token	<int_val>	INTEGER_LITERAL
%type	<int_val>	exp
%left	PLUS
%left	MULT 
*/

%token  NUM_TOKEN
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
%token  VI_TOKEN
%token	ERREUR_TOKEN

%%

/*
input:		/* empty */
/*		| exp	{ cout << "Result: " << $1 << endl; }
		;*/


program:        PROGRAM_TOKEN ID_TOKEN PV_TOKEN block PT_TOKEN;

block:  	declaration statement;

declaration:    VAR_TOKEN  vid PV_TOKEN;

vid: 		ID_TOKEN | ID_TOKEN VI_TOKEN vid ;

statement: 	BEGIN_TOKEN small_stat END_TOKEN;

small_stat:     %empty |w_r_stat small_stat | if_stat small_stat | while_stat small_stat |affectation_stat small_stat ;

affectation_stat: ID_TOKEN AFF_TOKEN operationform PV_TOKEN ;

operationform:  num |  num operation operationform ; 

num:		ID_TOKEN | NUM_TOKEN | PO_TOKEN operationform PF_TOKEN ;

operation:	PLUS_TOKEN | MINUS_TOKEN | DIV_TOKEN | MULT_TOKEN ;

w_r_stat:	write_stat | read_stat ;

write_stat:     WRITE_TOKEN PO_TOKEN ID_TOKEN PF_TOKEN PV_TOKEN ; 

read_stat:      READ_TOKEN PO_TOKEN ID_TOKEN PF_TOKEN  PV_TOKEN; 

if_stat:	IF_TOKEN condition THEN_TOKEN statement ; 

while_stat:	WHILE_TOKEN condition DO_TOKEN statement ; 

condition:      num comparaison_op num ;

comparaison_op: DIFF_TOKEN | EG_TOKEN |SUP_TOKEN | INF_TOKEN | INFEG_TOKEN | SUPEG_TOKEN ;




%%
/*
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
*/
int yyerror(const char *msg) {
    fprintf(stderr,"Error:%s\n",msg); return 0;
}




