%option yywrap

      /* Integrantes:
      Isabella Gomes Pereira - 2110317
      Thalita Rangel Bulos - 2020273
      */

      #include <stdio.h>
      #include <string.h>
      #include "y.tab.h"
%%

RECEBA      return(RECEBA);
DEVOLVA     return(DEVOLVA);
HORADOSHOW  return(HORADOSHOW);
AQUIACABOU  return(AQUIACABOU)
ENQUANTO    return(ENQUANTO);
FACA        return(FACA);
ZERA        return(ZERO);
SE          return(SE);
ENTAO       return(ENTAO);
SENAO       return(SENAO);
VEZES       return(VEZES);
FIM         return(FIM);
EXECUTE     retorn(EXECUTE);
\n          return(NEWLINE);
","         return(VIRGULA);
"="         return(IGUAL)
">"         return(MAIOR);
"<"         return(MENOR);
">="        return(MAIORIGUAL);
"<="        return(MENORIGUAL);
"+"         return(MAIS);
"*"         return(VEZES);
"("         return(APARENTESES);
")"         return(FPARENTESES);
[a-zA-Z]+   {yylval.str=strdup(yytext); return (VARNAME);} 
