type term =
  | True
  | False
  | Zero
  | Succ of term
  | Pred of term
  | IsZero of term
  | If of term * term * term

let rec evaluate = function
  | True              -> 1
  | False             -> 0
  | Zero              -> 0
  | Succ t            -> evaluate t + 1
  | Pred t            -> evaluate t - 1
  | IsZero t          -> if evaluate t = 0 then 1 else 0
  | If (cond, t, e)   -> if evaluate cond = 0 then evaluate e else evaluate t

let parse input =
  let tokens = String.split_on_char ' ' input |> List.filter (fun s -> s <> "") in
  let tokens = Array.of_list tokens in

  let cursor = ref 0 in
  let consume () =
    let tok = tokens.(!cursor) in
    incr cursor; tok
  in
  let rec parse_term () =
    match consume () with
    | "true"   -> True
    | "false"  -> False
    | "zero"   -> Zero
    | "succ"   -> Succ (parse_term ())
    | "pred"   -> Pred (parse_term ())
    | "iszero" -> IsZero (parse_term ())
    | "if"     ->
        let cond  = parse_term () in
        let _then_kw = consume () in  (* "then" keyword *)
        let t     = parse_term () in
        let _else_kw = consume () in  (* "else" keyword *)
        let e     = parse_term () in
        If (cond, t, e)
    | tok -> failwith ("Unexpected token: " ^ tok)
  in
  parse_term ()

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
