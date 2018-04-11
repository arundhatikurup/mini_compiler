%{

#include "lex.yy.c"
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
void yyerror(char *s);
int i=0;
char p='p';
%}


//%left '-''+'
%left '/''+'
%left '*''-'

%token STR
 
%%
prog : prog expr '\n' {printf("%c = %c\n",p,p-1);printf("Result=%d",$2);}
|
;
expr : STR
| expr '+' expr {if(i==0){ printf("%c = %d %c %d\n",p,$1,'+',$3); p++;i++;$$=$1+$3;}
		else{ printf("%c = %c %c %d\n",p,p-1,'+',$3);p++;$$=$1+$3;}}
| expr '-' expr {if(i==0){ printf("%c = %d %c %d\n",p,$1,'-',$3); p++;i++;$$=$1-$3;}
		else{ printf("%c = %c %c %d\n",p,p-1,'-',$3);p++;$$=$1-$3;}}
| expr '*' expr {if(i==0){ printf("%c = %d %c %d\n",p,$1,'*',$3); p++;i++;$$=$1*$3;}
		else{ printf("%c = %c %c %d\n",p,p-1,'*',$3);p++;$$=$1*$3;}}
| expr '/' expr {if(i==0){ printf("%c = %d %c %d\n",p,$1,'/',$3); p++;i++;$$=$1/$3;}
		else{ printf("%c = %c %c %d\n",p,p-1,'/',$3);p++;$$=$1/$3;}}

;
%%
 
void yyerror(char *s)
{
printf("%s\n",s);
}
 
int main()
{
printf("--Three address code generation --\n");
printf("Enter the expression:\n");
yyparse();
return 0;
}
