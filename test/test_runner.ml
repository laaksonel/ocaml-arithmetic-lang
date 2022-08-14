open Calculator_test

let tests =
  List.map
    (fun (name, speed, test) -> Alcotest.test_case name speed test)
    [ ("constant number", `Quick, Calculator.constant_number) ]

let () = Alcotest.run "calculator language tests" [ ("all", tests) ]
