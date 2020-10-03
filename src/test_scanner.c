/* 
   Test of the scanner for SL -- Simple Language.
   Prints one code and token per line.
   
   Exits on any lexical error.
   
   Returns code execution 0 even in case of errors so as not to
   confuse SuSy.
*/

/* Last update: "test_scanner.c: 2020-08-04 (Tue)  15:38:25 -03 (tk)" */

#include <stdio.h>
#include <stdlib.h>
#include "parser.h"

extern int yylex();

char *yytext;

extern int line_num;
extern int lexerror;

int yyerror(char *s) {

  printf("Lexical error detected on line %d.\n",line_num);
  printf("Last token read: '%s'\n\n",yytext);
  lexerror = 1;     /* to be used in later tasks */
  return 0;
  
}

int main() {

  char format[] = "%03d  %s\n";
  int code;
  
  do {
    code = yylex();
    
    switch (code) {

        case END_OF_FILE:        printf("%d lines read\n",line_num-1); break;
        case LEXICAL_ERROR:      exit(0);             /* message printed already */
    
        default:                 printf(format,code,yytext); break;
        
    }
    
  }  while (code!=END_OF_FILE);
    
  return 0;
      
}

    
    
