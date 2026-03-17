"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.evaluate = void 0;
var evaluate = function (term) {
    switch (term.type) {
        case "true":
            return 1;
        case "false":
            return 0;
        case "zero":
            return 0;
        case "succ":
            return (0, exports.evaluate)(term.t) + 1;
        case "pred":
            return (0, exports.evaluate)(term.t) - 1;
        case "iszero":
            return (0, exports.evaluate)(term.t) === 0 ? 1 : 0;
        case "if":
            return (0, exports.evaluate)(term.cond) === 0 ? (0, exports.evaluate)(term.else) : (0, exports.evaluate)(term.then);
    }
};
exports.evaluate = evaluate;
var term = {
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
};
var example = "succ zero"; /// this should be 1
// TODO write a parse function to then build a syntax tree like @term
var parsedTerm = function (input) {
    var tokens = input.split("/\s+/").filter(Boolean);
    var cursor = 0;
    var consume = function () {
        return tokens[cursor++];
    };
    var parseTerm = function () {
        var token = consume();
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
                var cond = parseTerm();
                consume(); // "then" keyword
                var then = parseTerm();
                consume(); // "else" keyword
                var els = parseTerm();
                return { type: "if", cond: cond, then: then, else: els };
            }
            default:
                throw new Error("Unexpected token: ".concat(token));
        }
    };
    return parseTerm();
};
var parsed_term = parsedTerm(example);
console.log((0, exports.evaluate)(parsed_term)); // output should be 3
