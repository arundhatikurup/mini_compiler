%{
#include<stdio.h>
#include<stdlib.h>
#include <math.h>
%}

DIGIT [0-9]+\.?|[0-9]*\.[0-9]+


%%

{DIGIT}    {yylval=atof(yytext);return NUM;}
"exit"	   {return exit_command;}
cos|COS		{return COS;}
sin|SIN 	{return SIN;}
tan|TAN 	{return TAN;}
log|LOG 	{return LOG;}
sqrt|SQRT	{return SQRT;}


\n|.    	{return yytext[0];}
