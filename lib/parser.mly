%{ open Ast %}

%token <int> INT
%token PLUS
%token MULT
%token EOF
%token LEFT_PAREN
%token RIGHT_PAREN

%left PLUS
%left MULT

%start <Ast.expr> prog

%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | i = INT { Int i }
  | e1 = expr; PLUS; e2 = expr { Binop (Add, e1, e2) }
  | e1 = expr; MULT; e2 = expr { Binop (Mult, e1, e2) }
  | LEFT_PAREN; e = expr; RIGHT_PAREN { e }
  ;
