%{
    #include "prova1.tab.h"
    #include <stdlib.h>
    #include <string.h>

    void yyerror(const char *msg);
    int yylex();
%}

%option noyywrap

NUMERO [0-9]+(\.[0-9]+)?
STRING \"[^\"]*\"
IDENTIFICADOR [A-Za-z][A-Za-z0-9_]*

%%

[ \t\r\n]+ ;
"//"[.]* ;

"print" {return PRINT;}
"concat" {return CONCAT;}
"length" {return LENGTH;}

"-" {return MINUS;}
"*" {return TIMES;}
"+" {return PLUS;}
"/" {return DIV;}
"," {return COMMA;}
"=" {return ASSIGN;}

"(" {return LPAREN;}
")" {return RPAREN;}

{IDENTIFICADOR} {return IDENT;}
{NUMERO} {return NUM;}
{STRING} {return STR;}

. {return ERROR;}

%%