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
console.log((0, exports.evaluate)(term));
