open Calculator_lib

let () =
  if Array.length Sys.argv != 2 then
    Printf.printf "Usage: ./calculator \"<expression>\"\n%!"
  else Sys.argv.(1) |> Interp.interp |> Printf.printf "Result %s\n%!"
