open Calculator_lib

let constant_number () =
  Alcotest.(check string)
    "constant number" (Interp.interp "22") (string_of_int 22)

let add () =
  Alcotest.(check string) "add" (Interp.interp "22 + 22") (string_of_int 44)
