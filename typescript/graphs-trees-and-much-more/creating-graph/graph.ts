type NodeID = string;

interface Edge {
  from: NodeID;
  to: NodeID;
  symbol: string;
}

export class Graph {
  private adjacency: Map<NodeID, Edge[]> = new Map();

  addNode(node: NodeID) {
    if (!this.adjacency.has(node)) {
      this.adjacency.set(node, []);
    }
  }

  addEdge(from: NodeID, to: NodeID, label: string) {
    this.addNode(from);
    this.addNode(to);
    this.adjacency.get(from)!.push({ from, to, label });
  }

  getEdges(node: NodeID): Edge[] {
    return this.adjacency.get(node) ?? [];
  }
}

const graph = new Graph();

graph.addEdge("a", "b", "a");
graph.addEdge("b", "c", "b");
graph.addEdge("c", "d", "c");
graph.addEdge("d", "e", "d");
graph.addEdge("e", "f", "e");
graph.addEdge("f", "g", "f");
graph.addEdge("g", "h", "g");
graph.addEdge("h", "i", "h");
console.log(graph.getEdges("a"));

export default Graph;
