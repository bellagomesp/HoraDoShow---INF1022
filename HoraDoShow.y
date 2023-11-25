%{

	/* Integrantes:
	Isabella Gomes Pereira - 2110317
    Thalita Rangel Bulos - 2020273
	*/

	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>

	
	int qtdParametros = 0; 

	void yyerror(const char *s) {
		fprintf(stderr, "%s\n", s);
	};

    int yylex();

%}

%union
  {
	char *str;
	int number;
};

%type <str> program varlist retorn cmds cmd;
%token <str> VARNAME;
%token <number> RECEBA;
%token <number> DEVOLVA;
%token <number> HORADOSHOW;
%token <number> AQUIACABOU;
%token <number> ENQUANTO;
%token <number> FACA;
%token <number> ZERO;
%token <number> SE;
%token <number> ENTAO;
%token <number> SENAO;
%token <number> VEZES;
%token <number> FIM;
%token <number> EXECUTE;
%token <number> NEWLINE;
%token <number> VIRGULA;
%token <number> IGUAL;
%token <number> MAIOR;
%token <number> MENOR;
%token <number> MAIORIGUAL;
%token <number> MENORIGUAL;
%token <number> MAIS;
%token <number> VEZES

%start program //Indica que o ponto de início do parsing é o não-terminal program
%%

program : RECEBA varlist DEVOLVA varlist HORADOSHOW cmds AQUIACABOU NEWLINE {printf("int horaDoShow(%s) {\n\n%s\n%s\n", $2, $6, $4);}
        ;

varlist : varlist VARNAME    {char *params=malloc(strlen($1) + strlen($2) + 7); sprintf(params, "%s, int %s", $1, $2); $$ = params; qtdParametros++;}
        | VARNAME            {char *param = malloc(strlen($1) + 5); sprintf(param,"int %s",$1); $$ = param; qtdParametros++;}    
        ;  

retorn  : VARNAME       {char *retorno = malloc(strlen($1) + 14); sprintf(retorno,"\treturn %s;\n\n}\n",$1); $$ = retorno;}
        ;

cmds    : cmds cmd       {char *comandos=malloc(strlen($1) + strlen($2) + 2); sprintf(comandos, "%s\t%s", $1, $2); $$=comandos;}
        | cmd            {char *comando=malloc(strlen($1) + 2); sprintf(comando, "\t%s", $1); $$=comando;}
        ;

cmd     : ENQUANTO VARNAME FACA cmds FIM            {char *indeterminada=malloc(strlen($2) + strlen($4) + 16); sprintf(indeterminada, "while (%s) {\n\t%s\t}\n", $2, $4); $$ = indeterminada;}
        | VARNAME IGUAL VARNAME                     {char *igualdade=malloc(strlen($1) + strlen($3) + 6); sprintf(igualdade, "%s = %s;\n",$1,$3); $$ = igualdade;}
        | ZERO APARENTESES VARNAME FPARENTESES      {char *zerar=malloc(strlen($3) + 7); sprintf(zerar, "%s = 0;\n",$3); $$ = zerar;};
        | SE VARNAME ENTAO cmds FIM                 {char *condicional1=malloc(strlen($2) + strlen($4) + 13); sprintf(condicional1, "if (%s) {\n\t%s\t}\n", $2, $4); $$ = condicional1;}
        | SE VARNAME ENTAO cmds SENAO cmds FIM      {char *condicional2=malloc(strlen($2) + strlen($4) + strlen($6) + 24); sprintf(condicional2, "if (%s) {\n\t%s\t}\n\telse{\n\t%s\t}\n", $2, $4, $6); $$ = condicional2;}
    
        | VARNAME MAIS VARNAME                      {char *soma=malloc(strlen($1) + strlen($3) + 6); sprintf(soma, "%s + %s;\n",$1,$3); $$ = soma;}
        | VARNAME VEZES VARNAME                     {char *multiplica=malloc(strlen($1) + strlen($3) + 6); sprintf(multiplica, "%s * %s;\n",$1,$3); $$ = multiplica;}
        ;

%%