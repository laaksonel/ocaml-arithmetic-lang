open Calculator_test

let tests =
  List.map
    (fun (name, speed, test) -> Alcotest.test_case name speed test)
    [
      ("constant number", `Quick, Calculator.constant_number);
      ("add", `Quick, Calculator.add);
      ("mult", `Quick, Calculator.mult);
      ("multiply many", `Quick, Calculator.mult_many);
      ("multiply and add", `Quick, Calculator.multiply_left_add);
      ("multiply and rightside plus", `Quick, Calculator.multiply_right_add);
    ]

let () = Alcotest.run "calculator language tests" [ ("all", tests) ]
