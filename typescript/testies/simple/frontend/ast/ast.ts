type Expr =
  | { kind: "Int"; value: number }
  | {
    kind: "Binary";
    op: "+" | "-" | "*" | "/";
    left: Expr;
    right: Expr;
  }


export { Expr };
