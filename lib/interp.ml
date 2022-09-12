let string_of_value (expr : Ast.expr) =
  match expr with Int i -> string_of_int i | Binop _ -> failwith ""

let is_value (expr : Ast.expr) =
  match expr with Int _ -> true | Binop _ -> false

let rec step (expr : Ast.expr) : Ast.expr =
  match expr with
  | Int _ -> failwith "Does not step"
  | Binop (bop, e1, e2) when is_value e1 && is_value e2 -> step_bop bop e1 e2
  | Binop (bop, e1, e2) when is_value e1 -> Binop (bop, e1, step e2)
  | Binop (bop, e1, e2) -> Binop (bop, step e1, e2)

and step_bop bop v1 v2 =
  match (bop, v1, v2) with Add, Int a, Int b -> Int (a + b) | _ -> failwith ""

let parse_expr = Lexer.from_string Parser.prog

let rec eval_expr (e : Ast.expr) =
  if is_value e then e else e |> step |> eval_expr

let interp s = s |> parse_expr |> eval_expr |> string_of_value
