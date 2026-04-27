%{
    #include "prova1.tab.h"
    #include <stdlib.h>
    #include <string.h>

    void yyerror(const char *msg);
    int yylex();
%}

%option noyywrap

NUMERO [0-9]+(.[0-9]+)?
COMENTARIO "//".*

%%

[ \t]+ ;
{Comentario} ;

{NUMERO} {return NUM;}

"-" {return MINUS;}
"*" {return TIMES;}
"+" {return PLUS;}
"/" {return DIV;}
"," {return COMMA;}

"(" {return LPAREN;}
")" {return RPAREN;}

. {return ERROR;}
\n {return EOL;}

%%
