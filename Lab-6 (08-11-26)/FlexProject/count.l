
%{
#include <stdio.h>
int count = 0;
%}

%%
[a-zA-Z]+ { count++; }
[ \t\n]+  ;
.         ;
%%

int main()
{
    printf("Enter text:\n");
    yylex();
    printf("Total words = %d\n", count);
    return 0;
}

int yywrap()
{
    return 1;
}
