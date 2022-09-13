open Calculator_lib

(* Call from command line with expression ./calculator "2 + 2" *)
let () = Sys.argv.(1) |> Interp.interp |> Printf.printf "Result %s\n%!"
