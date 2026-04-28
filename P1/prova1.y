%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL 0
%token NUM
%token DIV
%token PLUS
%token MINUS
%token TIMES
%token ERROR
%token LPAREN
%token RPAREN
%token IDENT
%token PRINT
%token CONCAT
%token COMMA
%token STR
%token ASSIGN
%token LENGTH

%start program

%%

program
    : stmt_list 
    ;

stmt_list
    : stmt
    | stmt_list stmt
    ;

stmt
    : IDENT ASSIGN expr
    | PRINT LPAREN exprlist RPAREN
    | expr
    ;

exprlist
    : exprlist COMMA exprlist
    | expr

expr
    : expr PLUS expr
    | expr MINUS expr
    | expr TIMES expr
    | expr DIV expr
    | LPAREN expr RPAREN 
    | CONCAT LPAREN exprlist RPAREN
    | LENGTH LPAREN exprlist RPAREN
    | NUM
    | STR
    | IDENT
    ;

%%