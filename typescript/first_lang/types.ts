export type Term =
  | { type: "true" }
  | { type: "false" }
  | { type: "zero" }
  | { type: "succ", t: Term }
  | { type: "pred", t: Term }
  | { type: "iszero", t: Term }
  | { type: "if", cond: Term, then: Term, else: Term }


export const evaluate = (term: Term): number => {
  switch (term.type) {
    case "true":
      return 1
    case "false":
      return 0
    case "zero":
      return 0
    case "succ":
      return evaluate(term.t) + 1
    case "pred":
      return evaluate(term.t) - 1
    case "iszero":
      return evaluate(term.t) === 0 ? 1 : 0
    case "if":
      return evaluate(term.cond) === 0 ? evaluate(term.else) : evaluate(term.then)
  }
}

const term: Term = {
  type: "if",
  cond: {
    type: "iszero",
    t: { type: "zero" }
  },
  then: {
    type: "succ",
    t: {
      type: "succ",
      t: {
        type: "succ",
        t: {
          type: "zero"
        }
      }
    }
  },
  else: {
    type: "succ",
    t: {
      type: "zero"
    }
  }
}

const example = "succ succ succ zero"; // evaluates to 3

const parsedTerm = (input: string): Term => {
  const tokens = input.split(/\s+/).filter(Boolean);
  let cursor = 0;
  const consume = (): string => {
    return tokens[cursor++];
  };

  const parseTerm = (): Term => {
    const token = consume();
    switch (token) {
      case "true":
        return { type: "true" };
      case "false":
        return { type: "false" };
      case "zero":
        return { type: "zero" };
      case "succ":
        return { type: "succ", t: parseTerm() };
      case "pred":
        return { type: "pred", t: parseTerm() };
      case "iszero":
        return { type: "iszero", t: parseTerm() };
      case "if": {
        const cond = parseTerm();
        consume(); // "then" keyword
        const then = parseTerm();
        consume(); // "else" keyword
        const els = parseTerm();
        return { type: "if", cond, then, else: els };
      }
      default:
        throw new Error(`Unexpected token: ${token}`);
    }
  };
  return parseTerm();
}

const parsed_term: Term = parsedTerm(example);

console.log(evaluate(parsed_term)) // output should be 3
