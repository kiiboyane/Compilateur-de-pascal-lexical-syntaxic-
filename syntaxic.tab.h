/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_SYNTAXIC_TAB_H_INCLUDED
# define YY_YY_SYNTAXIC_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUM_TOKEN = 258,
    IF_TOKEN = 259,
    THEN_TOKEN = 260,
    BEGIN_TOKEN = 261,
    END_TOKEN = 262,
    PROGRAM_TOKEN = 263,
    CONST_TOKEN = 264,
    VAR_TOKEN = 265,
    WHILE_TOKEN = 266,
    READ_TOKEN = 267,
    WRITE_TOKEN = 268,
    DO_TOKEN = 269,
    ID_TOKEN = 270,
    PLUS_TOKEN = 271,
    MINUS_TOKEN = 272,
    MULT_TOKEN = 273,
    DIV_TOKEN = 274,
    INF_TOKEN = 275,
    SUP_TOKEN = 276,
    EG_TOKEN = 277,
    AFF_TOKEN = 278,
    INFEG_TOKEN = 279,
    SUPEG_TOKEN = 280,
    PV_TOKEN = 281,
    PT_TOKEN = 282,
    PO_TOKEN = 283,
    PF_TOKEN = 284,
    DIFF_TOKEN = 285,
    VI_TOKEN = 286,
    ERREUR_TOKEN = 287
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "syntaxic.y" /* yacc.c:1909  */

  int		int_val;
  string*	op_val;

#line 92 "syntaxic.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SYNTAXIC_TAB_H_INCLUDED  */
