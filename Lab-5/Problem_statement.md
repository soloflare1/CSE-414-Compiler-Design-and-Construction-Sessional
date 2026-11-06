## Problem Statement 1: Implementation of Lexical Analyzer in C

Write a C program to implement a simple Lexical Analyzer that reads multiple lines of C source code and identifies & count different types of tokens.

The program should classify the input into the following six categories:

1\. Keyword: Identify reserved words such as `int`, `float`, `char`, `if`, `else`, `while`, `for`, `return`, `void`, etc.

2\. Identifier: Identify variable names and function names.

3\. Number: Identify integer and floating-point numbers.

4\. String: Identify text enclosed within double quotation marks (`"`).

5\. Operator: Identify different types of operators, including:

- Arithmetic Operators (`+`, `-`, `*`, `/`, `%`)
- Relational Operators (`==`, `!=`, `<`, `>`, `<=`, `>=`)
- Logical Operators (`&&`, `||`, `!`)
- Assignment Operators (`=`, `+=`, `-=`, `*=`, `/=`, `%=`)
- Increment/Decrement Operators (`++`, `--`)

6\. Special Symbol: Identify symbols such as `{`, `}`, `(`, `)`, `;`, `,`, `&`, etc.

### Input

Multiple lines containing C source code. The input should be read until the end of the file (EOF).

### Output

- Display each identified token along with its corresponding category.
- Count and display the total number of tokens in each category.
- Display the total number of tokens.

### Sample Input

```
int main() { float cgpa = 3.93; if (cgpa >= 3.90 && cgpa < 4.00) { printf("Excellent"); cgpa++; } return 0; }
```

### Sample Output (Category-wise)

```
Tokens:
float --> Keyword
cgpa --> Identifier
= --> 3.93 --> Number
, --> Special Symbol
target --> Identifier
= --> 4.00 --> Number
; --> Special Symbol
int --> Keyword
rank --> Identifier
= --> 1 --> Number
, --> Special Symbol
semester --> Identifier
= --> 6 --> Number
; --> Special Symbol
if --> Keyword
( --> Special Symbol
cgpa --> Identifier
>= --> 3.90 --> Number
&& --> target --> Identifier
== --> 4.00 --> Number
|| --> rank --> Identifier
== --> 1 --> Number
) --> Special Symbol
{ --> Special Symbol
cgpa --> Identifier
+= --> 0.07 --> Number
; --> Special Symbol
semester --> Identifier
++ --> Increment/Decrement Operator
; --> Special Symbol
printf --> Keyword
( --> Special Symbol
"CGPA = 4.00" --> String
) --> Special Symbol
; --> Special Symbol
} --> Special Symbol
else --> Keyword
{ --> Special Symbol
rank --> Identifier
++ --> Increment/Decrement Operator
; --> Special Symbol
cgpa --> Identifier
-= --> 0.10 --> Number
; --> Special Symbol
} --> Special Symbol
scanf --> Keyword
( --> Special Symbol
"%f" --> String
, --> Special Symbol
& --> Special Symbol
cgpa --> Identifier
) --> Special Symbol
; --> Special Symbol
return --> Keyword
0 --> Number
; --> Special Symbol
Keyword = 7
Identifier = 12
Number = 10
String = 2
Op = 13
Special Symbol = 23
Total Tokens = 67
```

---
## Problem Statement 2: Comment Detection in C

Write a C program to identify whether the given input is a Single Line Comment, Multi Line Comment, or Not a Comment.


### Sample Input/Output

1\. Single Line Comment

```
// This is a single line comment
```

Output:

```
Single Line Comment
```

2\. Multi Line Comment

```
/* This is a
   multi line comment */
```

Output:

```
Multi Line Comment
```

3\. Not a Comment

```
int cgpa = 4.00;
```

Output:

```
Not a Comment
```
