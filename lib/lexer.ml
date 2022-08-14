open Sedlexing.Utf8
open Parser

exception Invalid_token

let digit = [%sedlex.regexp? '0' .. '9']
let int = [%sedlex.regexp? Star '-', Plus digit]

let tokenizer buf =
  match%sedlex buf with
  | int -> INT (lexeme buf |> int_of_string)
  | eof -> EOF
  | _ ->
      let uchar = Sedlexing.lexeme_char buf 0 in
      print_string (Printf.sprintf "Invalid token %c\n" (Uchar.to_char uchar));
      raise Invalid_token

let provider buf () =
  let token = tokenizer buf in
  let start, stop = Sedlexing.lexing_positions buf in
  (token, start, stop)

let from_string f string =
  provider (from_string string)
  |> MenhirLib.Convert.Simplified.traditional2revised f
