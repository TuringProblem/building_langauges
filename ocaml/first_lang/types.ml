open Terms
open Parser

let rec evaluate = function
  | True              -> 1
  | False             -> 0
  | Zero              -> 0
  | Succ t            -> evaluate t + 1
  | Pred t            -> evaluate t - 1
  | IsZero t          -> if evaluate t = 0 then 1 else 0
  | If (cond, t, e)   -> if evaluate cond = 0 then evaluate e else evaluate t

let () =
  print_endline "Mini language REPL. Ctrl+D to exit.";
  try while true do
    print_string "> ";
    flush stdout;
    let line = input_line stdin in
    let trimmed = String.trim line in
    if trimmed <> "" then begin
      match parse trimmed with
      | term -> Printf.printf "%d\n" (evaluate term)
      | exception Failure msg -> Printf.printf "Error: %s\n" msg
    end
  done with End_of_file -> print_newline ()
