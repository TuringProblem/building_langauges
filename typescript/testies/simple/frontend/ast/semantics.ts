import { Expr } from "./ast";
import { ParseState, peek, advance } from "../parser";

/**
 * @author { @Override }
 * @since 20260210
 *
 * s = State
 **/
const parseExpr = (s: ParseState): [Expr, ParseState] => {
  let [left, state] = parseTerm(s);

  return [left, state];
}

const parseTerm = (s: ParseState): [Expr, ParseState] => {
  let [left, state] = parseFactor(s);

  return [left, state];
}

const parseFactor = (s: ParseState): [Expr, ParseState] => {
  const tok = peek(s);
  if (tok.tag === "INT") {
    return [{ kind: "Int", value: tok.value }, advance(s)];
  }

  if (tok.tag === "LPAREN") {
    const [expr, next] = parseExpr(advance(s));
    if (peek(next).tag !== "RPAREN") {
      throw new Error("Expected RPAREN");
    }
    return [expr, advance(next)];
  }
  throw new Error("Expected INT or LPAREN");
}
