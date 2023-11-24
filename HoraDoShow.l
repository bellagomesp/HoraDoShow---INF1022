%option yywrap


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
ZERA        return(ZERA);
SE          return(SE);
ENTAO       return(ENTAO);
SENAO       return(SENAO);
VEZES       return(VEZES);
FIM         return(FIM);
\n          return(NEWLINE); //?
">"         return(MAIOR);
"<"         return(MENOR);
">="        return(MAIORIGUAL);
"<="        return(MENORIGUAL);
"+"         return(MAIS);
"*"         return(VEZES);
[a-zA-Z]+   {yylval.str=strdup(yytext); return (ID);}