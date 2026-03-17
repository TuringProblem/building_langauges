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

console.log(evaluate(term)) // output should be 3
