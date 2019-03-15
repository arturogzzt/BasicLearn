grammar BasicLearn;

program
    : 'program' ID ';' ('declaration'|'function')* 'body'
    ;

body
    : 'start' 'block'
    ;

statement
    : ('expression' ';' | 'function_call' ';' | 'assignment' ';' | 'if' | 'repeat' | 'while')+
    ;

expression
    :  BOOL | 'exp' (LESSTHAN | MORETHAN | LESSOREQUAL | MOREOREQUAL | EQUALS | NOTEQUALS | ASSIGN) 'exp'
    ;

exp 
    : 'term' (ADD | SUBS)?
    ;

term 
    : 'factor' (MULT | DIV)?
    ;

factor 
    : LEFTPAREN 'expression' RIGHTPAREN | ID LEFTBRACKET 'exp' RIGHTBRACKET | CTE_I | CTE_F
    ;

assignment 
    : ID (LEFTBRACKET CTE_I RIGHTBRACKET)? ASSIGN 'expressiom' ';'
    ;

block
    : LEFTCURL 'statement'+ RIGHTCURL
    ;

declaration
    : 'type' ID (LEFTBRACKET CTE_I RIGHTBRACKET)? (',' ID (LEFTBRACKET CTE_I RIGHTBRACKET)?)* ';'
    ;

type
    : NUMBER | DECIMAL | BOOL | SENTENCE
    ;

function
    : ('type' | 'void') 'function' ID LEFTPAREN 'parameters' RIGHTPAREN ('declaration')* 'block'
    ;

function_call
    : ID LEFTPAREN 'expression' (',' 'expression')* RIGHTPAREN
    ;

parameters
    : 'type' ID (',' 'type' ID)*
    ;

if_statement
    : 'if' LEFTPAREN 'expression' ('logical' 'expression')* RIGHTPAREN 'block' ('else' 'block')?
    ;

repeat_statement
    : 'repeat' LEFTPAREN CTE_I RIGHTPAREN 'block'
    ;

while_statement
    : 'while' LEFTPAREN 'expression' ('logical' 'expression')* RIGHTPAREN 'block'
    ;

logical 
    : 'and' | 'or'
    ;


ID : [A-Z|a-z]([A-Za-z0-9_])*;
CTE_I : [0-9]+;
CTE_F : [0-9]+.[0-9]+;
BOOL : 'true' | 'false';
LESSTHAN : '<';
MORETHAN : '>';
LESSOREQUAL : '<=';
MOREOREQUAL : '>=';
EQUALS : 'equal';
NOTEQUALS : 'notEqual';
ASSIGN : '=';
ADD : '+';
SUBS : '-';
MULT : '*';
DIV : '/';
LEFTPAREN : '(';
RIGHTPAREN : ')';
LEFTBRACKET : '[';
RIGHTBRACKET : ']';
LEFTCURL : '{';
RIGHTCURL : '}';
NUMBER : 'number';
DECIMAL : 'decimal';
SENTENCE : 'sentence';
AND : 'and';
OR : 'or';

