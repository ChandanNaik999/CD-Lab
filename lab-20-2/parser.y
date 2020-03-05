%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 
%} 

%token A B NL 

/* Rule Section */
%% 
stmt: S NL { printf("valid string\n"); 
			exit(0); } 
; 
S: W | 
;
W: A W | B W | A | B 
;
%% 

int yyerror(char *msg) 
{ 
printf("invalid string\n"); 
exit(0); 
} 

//driver code 
main() 
{ 
printf("enter the string: "); 
yyparse(); 
} 
