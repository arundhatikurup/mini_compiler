%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
int yywrap(void);
%}
 
%%
[0-9]+ {yylval=atoi(yytext);return STR;}
[+-/*\n] return *yytext;
\
[ \t] {}
. {printf("invalid string");}
%%
 
int yywrap(void)
{
return 1;
}

