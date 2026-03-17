type Token =
  | { tag: "INT"; value: number }
  | { tag: "PLUS" | "MINUS" | "STAR" | "SLASH" }
  | { tag: "LPAREN" | "RPAREN" }
  | { tag: "EOF" };

export { Token };
