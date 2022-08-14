let string_of_value (expr : Ast.expr) =
  match expr with Int i -> string_of_int i

let is_value (expr : Ast.expr) = match expr with Int _ -> true
let step (expr : Ast.expr) = match expr with Int _ -> failwith "Does not step"
let parse_expr = Lexer.from_string Parser.prog

let rec eval_expr (e : Ast.expr) =
  if is_value e then e else e |> step |> eval_expr

let interp s = s |> parse_expr |> eval_expr |> string_of_value
