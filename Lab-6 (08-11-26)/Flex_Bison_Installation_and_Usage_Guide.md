# Compiler Design Lab: Complete Practical Guide Using Flex, Bison and MinGW

This guide covers all the practical work we have completed so far, including installation checks, source code, CMD commands, compilation, and expected outputs.

Project Location:

cmd

```cmd
%USERPROFILE%\Documents\FlexProject
```

## 1. Check Software Installation

Open Command Prompt (CMD).

Check Flex:

cmd

```cmd
flex --version
```

Expected output:

text

```text
flex version 2.5.4
```

Check Bison:

cmd

```cmd
bison --version
```

Expected output:

text

```text
bison (GNU Bison) 2.4.1
```

Check GCC (MinGW):

cmd

```cmd
gcc --version
```

Expected output:

text

```text
gcc (MinGW.org GCC-6.3.0-1) 6.3.0
```

All three programs are already installed on your computer.

# Experiment 1: Word Counting Using Flex

Objective: To implement a word-counting program using Flex.

### Step 1: Open the project folder

cmd

```cmd
cd /d "%USERPROFILE%\Documents\FlexProject"
```

### Step 2: Create the file

cmd

```cmd
notepad count.l
```

Click Yes if Windows asks to create a new file.

### Step 3: Write the following code

File name: `count.l`

c

```c

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
```

Save the file using `Ctrl + S`.

### Step 4: Compile using Flex

cmd

```cmd
flex count.l
```

### Step 5: Compile using GCC

cmd

```cmd
gcc lex.yy.c -o count.exe
```

### Step 6: Run the program

cmd

```cmd
count.exe
```

Enter the following input:

text

```text
Nosratee Jahan Naba
```

Press `Ctrl + Z` on a new line, then press Enter.

Expected output:

text

```text
Enter text:
Nosratee Jahan Naba
Total words = 3
```

Experiment 1 Completed# Experiment 2: Calculator Using Flex and Bison

Objective: To implement a simple calculator using Flex and Bison.

Flex works as the Lexical Analyzer, while Bison works as the Parser.

### Step 1: Open the project folder

cmd

```cmd
cd /d "%USERPROFILE%\Documents\FlexProject"
```

### Step 2: Create the Flex file

cmd

```cmd
notepad calc.l
```

File name: `calc.l`

c

```c

%{
#include <stdlib.h>
#include "calc.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       ;
\n          { return '\n'; }
.           { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}
```

Save the file using `Ctrl + S`.

### Step 3: Create the Bison file

cmd

```cmd
notepad calc.y
```

File name: `calc.y`

c

```c

%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%
input:
    | input expr '\n' {
        printf("Result = %d\n", $2);
    }
    ;

expr:
    NUMBER          { $$ = $1; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    ;
%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}
```

Save the file.

### Step 4: Compile using Bison

Use the new Bison installation:

cmd

```cmd
C:\GnuWin32\bin\bison.exe -d -o calc.tab.c calc.y
```

### Step 5: Compile using Flex

cmd

```cmd
flex calc.l
```

### Step 6: Compile using GCC

cmd

```cmd
gcc calc.tab.c lex.yy.c -o calculator.exe
```

### Step 7: Run the calculator

cmd

```cmd
calculator.exe
```

Enter:

text

```text
10+20
```

Expected output:

text

```text
Enter expression:
10+20
Result = 30
```

More test cases:

| Input | Expected result |
| --- | --- |
| `10+20` | 30 |
| `100-50` | 50 |
| `5*6` | 30 |
| `100/5` | 20 |
| `20+10*2` | 40 |

Experiment 2 Completed# Experiment 3: Token Recognition Using Flex

Objective: To identify keywords, identifiers, numbers, and special symbols using Flex.

### Step 1: Create a new file

cmd

```cmd
notepad token.l
```

File name: `token.l`

c

```c

%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"|"if"|"else"|"while" {
    printf("%s : Keyword\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s : Identifier\n", yytext);
}

[0-9]+ {
    printf("%s : Number\n", yytext);
}

[ \t\n]+ ;

. {
    printf("%s : Special Symbol\n", yytext);
}
%%

int main()
{
    printf("Enter a statement:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
```

Save using `Ctrl + S`.

### Step 2: Compile using Flex

cmd

```cmd
flex token.l
```

### Step 3: Compile using GCC

cmd

```cmd
gcc lex.yy.c -o token.exe
```

### Step 4: Run the program

cmd

```cmd
token.exe
```

Enter:

c

```c
int marks = 100;
```

Press `Ctrl + Z` on a new line, then Enter.

Expected output:

text

```text
Enter a statement:
int : Keyword
marks : Identifier
= : Special Symbol
100 : Number
; : Special Symbol
```

Experiment 3 Completed# 4. Difference Between Lexer and Parser

| Lexer | Parser |
| --- | --- |
| Lexical Analyzer | Syntax Analyzer |
| Identifies tokens | Checks grammar and syntax |
| Built using Flex | Built using Bison |
| Reads characters | Reads tokens |
| Example: `int`, `100` | Example: `10+20` grammar |

## 5. Project File Structure

Your `Documents\FlexProject` folder should contain these files:

text

```text
FlexProject/
│
├── count.l
├── count.exe
│
├── calc.l
├── calc.y
├── calc.tab.c
├── calc.tab.h
├── calculator.exe
│
├── token.l
├── token.exe
│
└── lex.yy.c
```

Note: `lex.yy.c` is regenerated whenever you run Flex. It will correspond to whichever `.l` file you compiled most recently.

## 6. Important CMD Commands

| Command | Purpose |
| --- | --- |
| `dir` | Show files in the folder |
| `cd foldername` | Enter a folder |
| `cd ..` | Go back one folder |
| `notepad count.l` | Create or open a file |
| `flex count.l` | Generate C code |
| `gcc lex.yy.c -o count.exe` | Compile Flex program |
| `count.exe` | Run the program |
| `C:\GnuWin32\bin\bison.exe -d -o calc.tab.c calc.y` | Generate Bison parser |
| `flex calc.l` | Generate calculator lexer |
| `gcc calc.tab.c lex.yy.c -o calculator.exe` | Compile calculator |
| `calculator.exe` | Run calculator |

## 7.  Summary

| No. | Practical | Tool |
| --- | --- | --- |
| 1 | Word Counting | Flex |
| 2 | Simple Calculator | Flex + Bison |
| 3 | Token Recognition | Flex |
| 4 | Syntax Analysis | Bison |
