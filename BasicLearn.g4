grammar BasicLearn;

program
    : 'program' ID ';' 'declaration'* 'function'* 'body'
    ;

body
    : 'start' 'block'
    ;

statement
    : ('function_call' ';' | 'assignment' ';' | 'if' | 'repeat' | 'while' | 'special_functions')
    ;

expression
    :  'exp' (LESSTHAN | MORETHAN | LESSOREQUAL | MOREOREQUAL | EQUALS | NOTEQUALS | ASSIGN) 'exp' (('and' | 'or') 'expression')?
    ;

exp 
    : 'term' (ADD | SUBS 'exp')?
    ;

term 
    : 'factor' (MULT | DIV 'term')?
    ;

factor 
    : LEFTPAREN 'expression' RIGHTPAREN | ID (LEFTBRACKET 'exp' RIGHTBRACKET | LEFTPAREN 'exp' RIGHTPAREN) | CTE_I | CTE_F | 'true' | 'false'
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
    : 'repeat' LEFTPAREN 'exp' RIGHTPAREN 'block'
    ;

while_statement
    : 'while' LEFTPAREN 'expression' RIGHTPAREN 'block'
    ;

special_function
    : 'area_tri' | 'perimeter_tri' | 'list_select' | 'show' | 'pythagoras' | 'listfunctions' | 'square_root_absolute' | 'square'
    ;

show
    : 'show' LEFTPAREN ('expression' | 'cte_string') RIGHTPAREN ';'
    ;

pythagoras
    : ('pythagorasHyp' | 'pythagorasSide') LEFTPAREN 'exp' ',' 'exp' RIGHTPAREN ';'
    ;

list_select
    : 'select' LEFTPAREN CTE_I ',' ID RIGHTPAREN ';'
    ;

list_functions
    : ('first' | 'last' | 'order' | 'orderDesc' | 'size') LEFTPAREN ID RIGHTPAREN ';'
    ;

perimeter_tri
    : 'perimeterTri' LEFTPAREN (ID | CTE_I | CTE_F) ',' (ID | CTE_I | CTE_F) ',' (ID | CTE_I | CTE_F) RIGHTPAREN ';'
    ;

square_root_absolute
    : ('square_root' | 'absolute') LEFTPAREN 'exp' RIGHTPAREN ';'
    ;

area_tri
    : 'areaTri' LEFTPAREN 'exp' ',' 'exp' RIGHTPAREN ';'
    ;

square
    : ('perimeterRec' | 'perimeterSq' | 'areaSq' | 'areaRec') LEFTPAREN 'exp' ',' 'exp' RIGHTPAREN ';'
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

