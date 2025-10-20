"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Graph = void 0;
var Graph = /** @class */ (function () {
    function Graph() {
        this.adjacency = new Map();
    }
    Graph.prototype.addNode = function (node) {
        if (!this.adjacency.has(node)) {
            this.adjacency.set(node, []);
        }
    };
    Graph.prototype.addEdge = function (from, to, label) {
        this.addNode(from);
        this.addNode(to);
        this.adjacency.get(from).push({ from: from, to: to, label: label });
    };
    Graph.prototype.getEdges = function (node) {
        var _a;
        return (_a = this.adjacency.get(node)) !== null && _a !== void 0 ? _a : [];
    };
    return Graph;
}());
exports.Graph = Graph;
var graph = new Graph();
graph.addEdge("a", "b", "a");
graph.addEdge("b", "c", "b");
graph.addEdge("c", "d", "c");
graph.addEdge("d", "e", "d");
graph.addEdge("e", "f", "e");
graph.addEdge("f", "g", "f");
graph.addEdge("g", "h", "g");
graph.addEdge("h", "i", "h");
console.log(graph.getEdges("a"));
exports.default = Graph;
