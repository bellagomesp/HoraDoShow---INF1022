%{

	/* Integrantes:
	Isabella Gomes Pereira - 2110317
        Thalita Rangel Bulos - 2020273
	*/

	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>

        #define YYERROR_VERBOSE 1

	
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

%type <str> program varlist retorn cmds cmd expr elem;
%token <str> VARNAME;
%token <str> NUM;
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
%token <number> END;
%token <number> EXECUTE;
%token <number> APARENTESES;
%token <number> FPARENTESES;
%token <number> LINEBREAK;
%token <number> VIRGULA;
%token <number> IGUAL;
%token <number> MAIOR;
%token <number> MENOR;
%token <number> MAIORIGUAL;
%token <number> MENORIGUAL;
%token <number> MAIS;
%token <number> MULTIPLICA;


%start program //Indica que o ponto de início do parsing é o não-terminal program
%%

program : RECEBA varlist DEVOLVA retorn HORADOSHOW cmds AQUIACABOU LINEBREAK {printf("int horaDoShow(%s) {\n\n%s\n%s\n", $2, $6, $4);}
        ;

varlist : varlist VIRGULA VARNAME                       {char *params=malloc(strlen($1) + strlen($3) + 7); sprintf(params, "%s, int %s", $1, $3); $$ = params; qtdParametros++;}
        | VARNAME                                       {char *param = malloc(strlen($1) + 5); sprintf(param,"int %s",$1); $$ = param; qtdParametros++;}    
        ;  

retorn  : VARNAME                                       {char *retorno = malloc(strlen($1) + 14); sprintf(retorno,"\treturn %s;\n\n}\n",$1); $$ = retorno;}
        ;
          

cmds    : cmds cmd                                      {char *comandos=malloc(strlen($1) + strlen($2) + 2); sprintf(comandos, "%s\t%s", $1, $2); $$ = comandos;}
        | cmd                                           {char *comando=malloc(strlen($1) + 2); sprintf(comando, "\t%s", $1); $$ = comando;}
        ;

cmd     : ENQUANTO VARNAME FACA cmds END                {char *loop1=malloc(strlen($2) + strlen($4) + 16); sprintf(loop1, "while (%s) {\n\t%s\t}\n", $2, $4); $$ = loop1;}
        | VARNAME IGUAL elem                            {char *igualdade1=malloc(strlen($1) + strlen($3) + 6); sprintf(igualdade1, "%s = %s;\n",$1,$3); $$ = igualdade1;}
        | VARNAME IGUAL cmd                             {char *igualdade2=malloc(strlen($1) + strlen($3) + 3); sprintf(igualdade2, "%s = %s",$1, $3); $$ = igualdade2;}
        | ZERO APARENTESES VARNAME FPARENTESES          {char *zerar=malloc(strlen($3) + 7); sprintf(zerar, "%s = 0;\n",$3); $$ = zerar;};
        | SE VARNAME ENTAO cmds END                     {char *condicional1=malloc(strlen($2) + strlen($4) + 13); sprintf(condicional1, "if (%s) {\n\t%s\t}\n", $2, $4); $$ = condicional1;}
        | SE VARNAME ENTAO cmds SENAO cmds END          {char *condicional2=malloc(strlen($2) + strlen($4) + strlen($6) + 24); sprintf(condicional2, "if (%s) {\n\t%s\t}\n\telse{\n\t%s\t}\n", $2, $4, $6); $$ = condicional2;}
        | VARNAME MAIS elem                             {char *soma=malloc(strlen($1) + strlen($3) + 6); sprintf(soma, "%s + %s;\n",$1,$3); $$ = soma;}
        | VARNAME MULTIPLICA elem                       {char *multiplica=malloc(strlen($1) + strlen($3) + 6); sprintf(multiplica, "%s * %s;\n",$1,$3); $$ = multiplica;}
        | EXECUTE cmds VEZES  elem END                 {char *loop2=malloc(strlen($2) + strlen($4) + 30); sprintf(loop2, "for (int i=0; i<%s; i++) {\n\t%s\t}\n", $4, $2); $$ = loop2;}
        | ENQUANTO expr FACA cmds END                   {char *loop3=malloc(strlen($2) + strlen($4) + 16); sprintf(loop3, "while (%s) {\n\t%s\t}\n", $2, $4); $$ = loop3;}
        ;

expr    : VARNAME MAIOR elem                            {char *maiorque=malloc(strlen($1) + strlen($3) + 4); sprintf(maiorque, "%s > %s", $1, $3); $$ = maiorque;}
        | VARNAME MENOR elem                            {char *menorque=malloc(strlen($1) + strlen($3) + 4); sprintf(menorque, "%s < %s", $1, $3); $$ = menorque;}
        | VARNAME MAIORIGUAL elem                       {char *maiorigualque=malloc(strlen($1) + strlen($3) + 5); sprintf(maiorigualque, "%s >= %s", $1, $3); $$ = maiorigualque;}
        | VARNAME MENORIGUAL elem                       {char *menorigualque=malloc(strlen($1) + strlen($3) + 5); sprintf(menorigualque, "%s <= %s", $1, $3); $$ = menorigualque;}
        ;

elem    : VARNAME                                       {char *variavel = malloc(strlen($1)); sprintf(variavel,"%s",$1); $$ = variavel;}
        | NUM                                           {char *numero = malloc(strlen($1)); sprintf(numero,"%s",$1); $$ = numero;}
        ;

%%

int main() {


    printf("#include <stdio.h>\n#include <stdlib.h>\n");

    yyparse();

    

    printf("int main(int argc, char *argv[]) {\n\n");
    printf("\tprintf(\"Saida -> %%d\\n\", horaDoShow(atoi(argv[1])");

    for (int i = 2; i < qtdParametros + 1; i++){
        printf(", atoi(argv[%d])", i);
    }

    printf("));\n\treturn 0;\n\n}");

    return 0;
}