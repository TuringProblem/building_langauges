function rK(base, k, i, j) {
    var _a;
    if (k < 0) {
        if (i === j)
            return "ε";
        return (_a = base[i][j]) !== null && _a !== void 0 ? _a : "";
    }
    var direct = rK(base, k - 1, i, j);
    var viaK = concat(rK(base, k - 1, i, k), star(rK(base, k - 1, k, k)), rK(base, k - 1, k, j));
    return union(direct, viaK);
}
function gnfaToRegex(base) {
    var n = base.length;
    return rK(base, n - 1, 0, n - 1);
}
/**
 * This is the Helping functions that hold true under DFA, NFA, GNFA, RE, etc... Rememeber, that DFA <=> NFA <=> GNFA <=> RE.
 *
 */
var union = function (a, b) {
    if (a === "")
        return b;
    if (b === "")
        return a;
    return "(".concat(a, "|").concat(b, ")");
};
var concat = function () {
    var parts = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        parts[_i] = arguments[_i];
    }
    return parts.filter(function (x) { return x !== ""; }).join("");
};
var star = function (a) {
    if (a === "" || a === "ε")
        return "ε";
    return "(".concat(a, ")*");
};
var testCases = [
    ["", ""],
    ["a", "a"],
];
testCases.forEach(function (_a) {
    var input = _a[0], expected = _a[1];
    var actual = gnfaToRegex(input.split("").map(function (x) { return [x]; }));
    console.log(actual);
    console.log(expected);
    if (actual === expected) {
        console.log("PASS");
    }
    else {
        console.log("FAIL");
    }
});
