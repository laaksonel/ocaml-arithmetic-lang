open Calculator_lib

let constant_number () =
  Alcotest.(check string)
    "constant number" (Interp.interp "22") (string_of_int 22)

let add () =
  Alcotest.(check string) "add" (Interp.interp "2 + 2") (string_of_int 4)

let mult () =
  Alcotest.(check string) "multiple" (Interp.interp "2 * 2") (string_of_int 4)

let mult_many () =
  Alcotest.(check string)
    "multiply many"
    (Interp.interp "2 * 2 * 2")
    (string_of_int 8)

let multiply_left_add () =
  Alcotest.(check string)
    "mulitply and leftside add"
    (Interp.interp "2 + 2 * 2")
    (string_of_int 6)

let multiply_right_add () =
  Alcotest.(check string)
    "mulitply and add"
    (Interp.interp "2 * 2 + 2")
    (string_of_int 6)
