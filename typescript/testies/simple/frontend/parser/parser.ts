import { Token } from "../tokenizer";

/**
 * @author { @Override }
 * @since 20260210
 *
 * This files is the tokenizer for the simple arithmetic language... 
 * it breaks down the input source code and parses down into a tree using precedence
 *
 *
 * @returns {Token[]} - the tokens that are parsed from the input source code to be passed into the AST
 **/
const tokenize = (input: string): Token[] => {
  let i = 0;
  const tokens: Token[] = [];
  const isDigit = (c: string) => c >= "0" && c <= "9";

  while (i < input.length) {
    const c = input[i];
    if (c === " ") {
      i++;
      continue;
    }
    if (isDigit(c)) {
      let num = "";
      while (i < input.length && isDigit(input[i])) {
        num += input[i++];
      }
      tokens.push({ tag: "INT", value: Number(num) });
      continue;
    }
    const opMap: Record<string, Token["tag"]> = {
      "+": "PLUS",
      "-": "MINUS",
      "*": "STAR",
      "/": "SLASH",
      "(": "LPAREN",
      ")": "RPAREN",
    };

    if (opMap[c]) {
      tokens.push({ tag: opMap[c] });
      i++;
      continue;
    }

    throw new Error(`Unexpected character ${c}`);
  }

  tokens.push({ tag: "EOF" });

  return tokens;
}

export default tokenize;
