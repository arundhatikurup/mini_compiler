%{
    #include<ctype.h>
    #include<stdio.h>
    #include <math.h>
    #include<stdlib.h>
    #define YYSTYPE double
    
    int yylex(void);
    void yyerror(char *s);
%}


%token NUM
%token COS SIN TAN LOG 
%token SQRT
%token BOOL


%left '+' '-' 
%left '*' '/' '%' 
%left '&' '|' '!' 'x'

%token exit_command
%token echo


%%

S         : S E '\n' { printf("Answer: %g \nEnter next expression:\n", $2); }
           | S '\n'
           | 
           | error '\n' { yyerror("Error: Enter once more...\n" );yyerrok; }
	   
           ;
E         : E '+' E    { $$ = $1 + $3; }
           | E'-'E    { $$=$1-$3; }
           | E'*'E    { $$=$1*$3; }
           
            |E'/'E    { $$=$1/$3; }
            |E'&'E		{ $$=(int)$1&(int)$3; }
            |E'|'E		{ $$=(int)$1|(int)$3; }
   
 		
           | '('E')'    { $$=$2; }
            
           | NUM
           | COS'('E')' {$$=cos($3);}
           | SIN'('E')' {$$=sin($3);}
           | TAN'('E')' {$$=tan($3);}
           | LOG'('E')' {$$=log($3);}
	| SQRT'('E')' {$$=sqrt($3);}
	| exit_command 		{exit(EXIT_SUCCESS);}
            
           ;


%%

#include "lex.yy.c"

int main()
{
    printf("Enter the expression: ");
    yyparse();
}

