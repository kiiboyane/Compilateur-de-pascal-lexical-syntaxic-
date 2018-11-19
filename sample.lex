/* scanner for a toy Pascal-like language */

%{
/* need this for the call to atof() below */
#include <math.h>
#include<string.h> 
#include<stdio.h>
#include<stdlib.h> 

%}

DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*
%%

{DIGIT}+    {
            printf( "NUM_TOKEN: %s (%d)\n", yytext,
                    atoi( yytext ) );
            }

{DIGIT}+"."{DIGIT}*        {
            printf( "NUM_TOKEN: %s (%g)\n", yytext,
                    atof( yytext ) );
            }

[i|I][F|f]     {
            printf( "IF_TOKEN \n" );
            }

[t|T][H|h][e|E][N|n]       {
            printf( "TEHN_TOKEN \n");
            }
[b|B][E|e][g|G][i|I][N|n]          {
            printf( "BEGIN_TOKEN \n" );
            }
[e|E][N|n][d|D]     {
            printf( "END_TOKEN \n" );
            }
[P|p][R|r][G|g][R|r][A|a][M|m] printf("PROGRAM_TOKEN \n") ; 

[C|c][O|o][N|n][S|s][t|T] printf("CONST_TOKEN \n") ; 

[V|v][A|a][R|r] printf("VAR_TOKEN \n") ; 

[W|w][h|H][i|I][l|L][E|e] printf("WHILE_TOKEN \n") ;
[R|r][e|E][a|A][d|D] printf("READ_TOKEN \n") ;

[W|w][R|r][I|i][T|t][E|e] printf("WRITE_TOKEN \n") ;
[D|d][O|o] printf("DO_TOKEN\n");
EOF  printf( "END_TOKEN \n" );

{ID}        printf( "ID_TOKEN  : %s \n" , yytext );

"+"  printf( "PLUS_TOKEN \n" );
"-"  printf( "MINUS_TOKEN \n" );
"*"  printf( "MULT_TOKEN \n" );
"/"  printf( "DIV_TOKEN \n" );
"<"  printf( "INF_TOKEN \n" );
">"  printf( "SUP_TOKEN \n" );
"="  printf( "EG_TOKEN \n" );
":="  printf( "AFF_TOKEN \n" );
"<="  printf( "INFEG_TOKEN \n" );
">="  printf( "SUPEG_TOKEN \n" );
";"  printf( "PV_TOKEN \n" );
"."  printf( "PT_TOKEN \n" );
"("  printf( "PO_TOKEN \n" );
")"  printf( "PF_TOKEN \n" );
"<>"  printf( "DIFF_TOKEN \n" );




"{*"[^}\n]*"*}"     /* eat up one-line comments */

[ \t\n]+          /* eat up whitespace */

.           printf( "ERREUR %s\n", yytext );

%%

main( argc, argv )
int argc;
char **argv;
    {
         yyin =fopen("pascal.p" , "r") ; 
	 yypush_buffer_state(yy_create_buffer(yyin,YY_BUF_SIZE));
	 yylex();
       
    }
