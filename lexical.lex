/* Mini Calculator */
/* calc.lex */

%{
#include "heading.h"
#include "tok.h"
int yyerror(char *s);

//int yylineno = 1;
%}

/*digit		[0-9]
int_const	{digit}+

%%

{int_const}	{ yylval.int_val = atoi(yytext); return INTEGER_LITERAL; }
"+"		{ yylval.op_val = new std::string(yytext); return PLUS; }
"*"		{ yylval.op_val = new std::string(yytext); return MULT; }

[ \t]*		{}
[\n]		{ yylineno++;	}

.		{ std::cerr << "SCANNER "; yyerror(""); exit(1);	}

DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*
%%*/

DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*
%%

{DIGIT}+    {
            printf( "NUM_TOKEN: %s (%d)\n", yytext,
                    atoi( yytext ) );
             return NUM_TOKEN;
            }

{DIGIT}+"."{DIGIT}*        {
            printf( "NUM_TOKEN: %s (%g)\n", yytext,
                    atof( yytext ) );return NUM_TOKEN; 
            }

[i|I][F|f]     {
            printf( "IF_TOKEN \n" );return IF_TOKEN;
            }

[t|T][H|h][e|E][N|n]       {
            printf( "TEHN_TOKEN \n");return THEN_TOKEN;
            }
[b|B][E|e][g|G][i|I][N|n]          {
            printf( "BEGIN_TOKEN \n" );return BEGIN_TOKEN;
            }
[e|E][N|n][d|D]     {
            printf( "END_TOKEN \n" );return END_TOKEN;
            }
[P|p][R|r][O|o][G|g][R|r][A|a][M|m] {printf("PROGRAM_TOKEN \n") ;return PROGRAM_TOKEN;
            } 

[C|c][O|o][N|n][S|s][t|T] { printf("CONST_TOKEN \n") ; return CONST_TOKEN;
            }

[V|v][A|a][R|r] {printf("VAR_TOKEN \n") ; return VAR_TOKEN;
            }

[W|w][h|H][i|I][l|L][E|e] {printf("WHILE_TOKEN \n") ; return WHILE_TOKEN;
            }
[R|r][e|E][a|A][d|D] {printf("READ_TOKEN \n") ;return READ_TOKEN;
            }

[W|w][R|r][I|i][T|t][E|e] {printf("WRITE_TOKEN \n") ;return WRITE_TOKEN;
            }
[D|d][O|o] {printf("DO_TOKEN\n");return DO_TOKEN;
            }
EOF { printf( "END_TOKEN \n" );return END_TOKEN;
            }

{ID}        {printf( "ID_TOKEN  : %s \n" , yytext );return ID_TOKEN;
            }

"+" { printf( "PLUS_TOKEN \n" );return PLUS_TOKEN;
            }
"-"  {printf( "MINUS_TOKEN \n" );return MINUS_TOKEN;
            }
"*"  {printf( "MULT_TOKEN \n" );return  MULT_TOKEN;
            }
"/"  {printf( "DIV_TOKEN \n" );return DIV_TOKEN;
            }
"<" { printf( "INF_TOKEN \n" );return INF_TOKEN;
            }
">"  {printf( "SUP_TOKEN \n" );return SUP_TOKEN;
            }
"="  {printf( "EG_TOKEN \n" );return EG_TOKEN;
            }
":="  {printf( "AFF_TOKEN \n" );return AFF_TOKEN;
            }
"<=" { printf( "INFEG_TOKEN \n" );return INFEG_TOKEN;
            }
">="  {printf( "SUPEG_TOKEN \n" );return SUPEG_TOKEN;
            }
";" { printf( "PV_TOKEN \n" );return PV_TOKEN;
            }
"." { printf( "PT_TOKEN \n" );return PT_TOKEN;
            }
"(" { printf( "PO_TOKEN \n" );return PO_TOKEN;
            }
")"  {printf( "PF_TOKEN \n" );return PF_TOKEN;
            }
"<>" { printf( "DIFF_TOKEN \n" );return DIFF_TOKEN;

            }
"," { printf( "VI_TOKEN \n" );return VI_TOKEN;

            }




"{*"[^}\n]*"*}"     
[ \t\n]+         

.          { printf( "ERREUR %s\n", yytext );return ERREUR_TOKEN;
            }
