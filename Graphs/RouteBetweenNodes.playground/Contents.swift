
/*
 * Route Between Nodes
 * Given a directed graph,
 * design an algorithm to find out whether there is a route between two nodes
 */
func serach(graph: Graph, start: Node, end: Node) -> Bool {
    if start === end {
        return true
    }
    
    // operates as Queue
    var queue: [Node] = []
    
    for each in graph.nodes {
        each?.state = .Unvisited
    }
    
    start.state = .Visiting
    queue.append(start)
    
    var dequeued: Node
    
    while !queue.isEmpty {
        
        dequeued = queue.removeFirst() // dequeue
        
        for v in dequeued.adjacent {
            
            guard let adjcent = v else { continue }
            
            if adjcent === end {
                return true
            } else {
                adjcent.state = .Visiting
                queue.append(adjcent)
            }
            
        }
        
        dequeued.state = .Visited
    }
    return false
}

public class Graph {
    public var nodes: [Node?]
    init(_ nodes: [Node?]) {
        self.nodes = nodes
    }
}

public class Node {
    public var val: Int
    public var adjacent: [Node?]
    var state: State = .Unvisited
    
    public init() { self.val = 0; adjacent = []; state}
    public init(_ val: Int) { self.val = val; adjacent = []}
    public init(_ val: Int, _ adjacent: [Node]) {
        self.val = val
        self.adjacent = adjacent
    }
}

enum State {
    case Unvisited
    case Visited
    case Visiting
}


/*
 * Ex1
 */

let ex1Node2 = Node(2)
let ex1Node1 = Node(1, [ex1Node2])

let ex1Graph = Graph([
    ex1Node1, ex1Node2
])

serach(graph: ex1Graph, start: ex1Node1, end: ex1Node2)


