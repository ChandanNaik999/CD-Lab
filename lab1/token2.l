
%{
%}


letter [a-zA-Z]
digit [0-9]

%%

\/\*(.*\n)*.*\*\/  {};	
\n {yylineno++; fprintf(yyout, "\n%d ", yylineno); };





#include<{letter}+(\.{letter}*)?>|return|main|for|while|case|switch|if|else|int|float|char|struct|\(|\)|{letter}({letter}|{digit})*|{digit}+|\{|\}|{digit}+"E"(\+|\-)?{digit}+|{digit}+\.{digit}+(E(\+|\-)?{digit}+)?|=|\"({letter}|{digit}|" ")*\"|; fprintf(yyout,"%s ",yytext);
[\t' '] {};
%%




int yywrap(){
    return 1;
}

int main(int argc, char * argv[]){
    yyin=fopen("input.c","r");
    yyout=fopen("out.c","w");
    fprintf(yyout,"1 ");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}
