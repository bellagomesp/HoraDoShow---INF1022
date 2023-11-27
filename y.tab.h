/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VARNAME = 258,
     NUM = 259,
     RECEBA = 260,
     DEVOLVA = 261,
     HORADOSHOW = 262,
     AQUIACABOU = 263,
     ENQUANTO = 264,
     FACA = 265,
     ZERO = 266,
     SE = 267,
     ENTAO = 268,
     SENAO = 269,
     VEZES = 270,
     END = 271,
     EXECUTE = 272,
     APARENTESES = 273,
     FPARENTESES = 274,
     LINEBREAK = 275,
     VIRGULA = 276,
     IGUAL = 277,
     MAIOR = 278,
     MENOR = 279,
     MAIORIGUAL = 280,
     MENORIGUAL = 281,
     MAIS = 282,
     MULTIPLICA = 283
   };
#endif
/* Tokens.  */
#define VARNAME 258
#define NUM 259
#define RECEBA 260
#define DEVOLVA 261
#define HORADOSHOW 262
#define AQUIACABOU 263
#define ENQUANTO 264
#define FACA 265
#define ZERO 266
#define SE 267
#define ENTAO 268
#define SENAO 269
#define VEZES 270
#define END 271
#define EXECUTE 272
#define APARENTESES 273
#define FPARENTESES 274
#define LINEBREAK 275
#define VIRGULA 276
#define IGUAL 277
#define MAIOR 278
#define MENOR 279
#define MAIORIGUAL 280
#define MENORIGUAL 281
#define MAIS 282
#define MULTIPLICA 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 24 "HoraDoShow.y"
{
	char *str;
	int number;
}
/* Line 1529 of yacc.c.  */
#line 110 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

