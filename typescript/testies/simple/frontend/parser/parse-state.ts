import { Token } from "../tokenizer";

type ParseState = {
  tokens: Token[];
  pos: number;
};

const peek = (state: ParseState) => state.tokens[state.pos];
const advance = (state: ParseState) => ({ ...state, pos: state.pos + 1 });

export { ParseState, peek, advance };


