# A Scanner for SL - Simple Language
Implementation of a Scanner (lexical analysis phase) for the Simple Language compiler.

This is project developed for the subject MO403 - Implementation of Programming Languages taught by professor Tomasz Kowaltowski during the second semester of 2020. 

The subject website: https://sites.google.com/unicamp.br/ic-mo403-mc900/main

## Project Description
The purpose of this task is the implementation of a scanner for SL (Simple Language), including optional features, using the Linux tool `flex`. 
Only one file (`scanner.l`) should be submitted. The scanner will be tested by the execution of the program `test_scanner` whose C source is provided for download 
from the folder of auxiliary files, together with the file `parser.h` which should be imported by the submitted `scanner.l` file:

```
     #include "parser.h"
```

This file contains the declarations and token symbols which will be provided in the next task by the tool implementing a parser. The scanner is responsible for 
updating the value of the external variable `line_num` which should always contain the number of the current source line (initial value is `1`).

The scanner should return a pseudo-token symbol `LEXICAL_ERROR` so that the test program can output appropriate error messages. For each valid token it will 
print its code and its value as a string which is contained in the variable `yytext`.

The submission will be processed by the following sequence of Linux commands:

```
	flex -i -o scanner.c scanner.l;
	gcc -std=c99 -pedantic -o test_scanner *.c
        for each test NN:
              test_scanner  <  progNN.sl  >  tokensNN.res
```

Notice that the option `-i` produces a case insensitive scanner. However this option affects only the recognition process and does not change the value of the
variable `yytext` to be printed.

### Remarks:

- Read the `flex` manual!
- The scanner should accept (and ignore) line comments of the form `// ... `.
- File `all.zip` (see auxiliary files) provides the test program and the include file mentioned above as well as the input files for tests and their results.
- Maximum number of submissions is `10` — test your solutions exhaustively before submission!
- The result of this task will be used with minor adjustments in the next phases of the SL compiler.
- This task is worth 10% of the final project grade.

### Obs
The `all.zip` file mentioned had the files contained in the directory `tests` and the files `src/parser.h` and `test_scanner.c`.

## Project Execution

In order to run the program that uses the produced scanner use the following command:
```
make run
```

In order to run the tests use:
```
make test
```
