
/*
 * Write an algorithm to find the "next" node(i.e., in-order successor)
 * of a given node in a binary search tree.
 */

class Node{

    var data: Int
    var parent: Node?
    var right: Node?
    var left: Node?
    
    init(_ data: Int) {
        self.data = data
    }
    
}

func inOrderSucc(_ root: Node?) -> Node? {
    print(root)

    guard let n = root else {
        return nil
    }
    
    // Found right children -> return leftmost node of right subtree
    if let rightNode = n.right {
        return leftMostChild(rightNode)
    } else {
        var child = n
        var parent = child.parent
        
        // Go up until we are on left instead of right
        while let p = parent {
            print(p)
            if p.left === child {
                break
            }
            
            child = p
            parent = p.parent
        }
        
        return parent
    }
    
}

func leftMostChild(_ n: Node) -> Node? {
    var leftmost = n
    
    while let leftNode = leftmost.left {
        leftmost = leftNode
    }
    
    return leftmost
}



let root = Node(1)
let left1 = Node(2)
let right1 = Node(3)

let left1_1 = Node(4)
let right1_1 = Node(5)

root.left = left1
root.right = right1

left1.left = left1_1
left1.right = right1_1

//let result = inOrderSucc(root)
//print("result = \(result?.data ?? -1)")

let result2 = inOrderSucc(left1_1)
print("result2 = \(result2?.data ?? -1)")


