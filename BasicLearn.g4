grammar BasicLearn;

program
    : 'program' ID ';' declaration* function* body
    ;

body
    : 'start' block
    ;

expression
    :  exp ((LESSTHAN | MORETHAN | LESSOREQUAL | MOREOREQUAL | EQUALS | NOTEQUALS) exp (('and' | 'or') expression)?)?
    ;

exp
    : term (ADD exp| SUBS exp)?
    ;

term
    : factor (MULT term| DIV term)?
    ;

factor
    : LEFTPAREN expression RIGHTPAREN | ID (LEFTBRACKET exp RIGHTBRACKET | LEFTPAREN exp (',' exp)* RIGHTPAREN)? | CTE_I | CTE_F | 'true' | 'false'
    ;

assignment
    : ID (LEFTBRACKET (CTE_I|ID) RIGHTBRACKET)? ASSIGN expression
    ;

block
    : LEFTCURL statement+ RIGHTCURL
    ;

type
    : NUMBER | DECIMAL | BOOL | SENTENCE
    ;

statement
    : (function_call ';' | assignment ';' | 'return' exp ';' | if_statement | repeat_statement | while_statement | special_function ';')
    ;

function
    : (type | 'void') 'function' ID LEFTPAREN (parameters)? RIGHTPAREN LEFTCURL (declaration)* statement+ RIGHTCURL
    ;

declaration
    : type ID (LEFTBRACKET CTE_I RIGHTBRACKET)? (',' ID (LEFTBRACKET CTE_I RIGHTBRACKET)?)* ';'
    ;

function_call
    : ID LEFTPAREN (expression (',' expression)*)? RIGHTPAREN
    ;

parameters
    : type ID (',' type ID)*
    ;

if_statement
    : 'if' LEFTPAREN expression RIGHTPAREN block ('else' block)?
    ;

repeat_statement
    : 'repeat' LEFTPAREN exp RIGHTPAREN block
    ;

while_statement
    : 'while' LEFTPAREN expression RIGHTPAREN block
    ;

special_function
    : (area_tri | perimeter_tri | list_select | show | pythagoras | list_functions | square_root_absolute | square)
    ;

show
    : 'show' LEFTPAREN (expression | SENTENCE | special_function) RIGHTPAREN
    ;

pythagoras
    : ('pythagorasHyp' | 'pythagorasSide') LEFTPAREN exp ',' exp RIGHTPAREN
    ;

list_select
    : 'select' LEFTPAREN exp ',' ID RIGHTPAREN
    ;

list_functions
    : ('first_l' | 'last_l' | 'order_l' | 'orderDesc_l' | 'size_l') LEFTPAREN ID RIGHTPAREN
    ;

perimeter_tri
    : 'perimeterTri' LEFTPAREN exp ',' exp ',' exp RIGHTPAREN
    ;

square_root_absolute
    : ('square_root' | 'absolute') LEFTPAREN 'exp' RIGHTPAREN
    ;

area_tri
    : 'areaTri' LEFTPAREN 'exp' ',' 'exp' RIGHTPAREN
    ;

square
    : ('perimeterRec' | 'perimeterSq' | 'areaSq' | 'areaRec') LEFTPAREN 'exp' ',' 'exp' RIGHTPAREN
    ;

BOOL : 'bool';
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
ID : [A-Z|a-z]([A-Za-z0-9_])*;
CTE_I : [0-9]+;
CTE_F : [0-9]+.[0-9]+;
SENTENCE : '"' (ESC|.)*? '"' ;
AND : 'and';
OR : 'or';
BSPACE  : [ \t\n\r]+ -> skip ;

fragment
ESC : '\\"' | '\\\\' ;
