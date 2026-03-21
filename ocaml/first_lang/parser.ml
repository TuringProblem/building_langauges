open Terms 

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
    | "0"      -> Zero
    | "succ"   -> Succ (parse_term ())
    | "pred"   -> Pred (parse_term ())
    | "iszero" -> IsZero (parse_term ())
    | "if"     ->
        let cond  = parse_term () in
        let _then_kw = consume () in 
        let t     = parse_term () in
        let _else_kw = consume () in
        let e     = parse_term () in
        If (cond, t, e)
    | tok -> failwith ("Unexpected token: " ^ tok)
  in
  parse_term ()


