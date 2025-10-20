type Regex = string;
type Matrix = Regex[][];

function rK(base: Matrix, k: number, i: number, j: number): Regex {
  if (k < 0) {
    if (i === j) return "ε";
    return base[i][j] ?? "";
  }

  const direct = rK(base, k - 1, i, j);

  const viaK = concat(
    rK(base, k - 1, i, k),
    star(rK(base, k - 1, k, k)),
    rK(base, k - 1, k, j),
  );

  return union(direct, viaK);
}

function gnfaToRegex(base: Matrix): Regex {
  const n = base.length;
  return rK(base, n - 1, 0, n - 1);
}


/**
 * This is the Helping functions that hold true under DFA, NFA, GNFA, RE, etc... Rememeber, that DFA <=> NFA <=> GNFA <=> RE.
 * 
 */

const union = (a: Regex, b: Regex) => {
  if (a === "") return b;
  if (b === "") return a;
  return `(${a}|${b})`;
}

const concat = (...parts: Regex[]): Regex  => parts.filter((x) => x !== "").join("");

const star = (a: Regex): Regex => {
  if (a === "" || a === "ε") return "ε";
  return `(${a})*`;
}


const testCases = [
  ["", ""],
  ["a", "a"],

];

testCases.forEach(([input, expected]) => {
  const actual = gnfaToRegex(input.split("").map((x) => [x]));
  console.log(actual);
  console.log(expected);
  if (actual === expected) {
    console.log("PASS");
  } else {
    console.log("FAIL");
  }
});
