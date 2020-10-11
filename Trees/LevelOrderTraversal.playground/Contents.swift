/*
 * Binary Tree Level Order Traversal
 * Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 */

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let rootNode = root else {
        return []
    }
    var result:[[Int]] = []
    
    var rootArr:[TreeNode] = []
    rootArr.append(rootNode)
    
    var rootData:[Int] = []
    rootData.append(rootNode.val)
    result.append(rootData)
    
    var queue: [[TreeNode]] = []
    queue.append(rootArr)
    
    while !queue.isEmpty {
        var leveled: [TreeNode] = []
        var leveledData: [Int] = []
        for node in queue.removeFirst() {
            
            // left
            if let leftNode = node.left {
                leveled.append(leftNode)
                leveledData.append(leftNode.val)
            }
            
            // right
            if let rightNode = node.right {
                leveled.append(rightNode)
                leveledData.append(rightNode.val)
            }
            
        }
        if !leveled.isEmpty {
            queue.append(leveled)
        }
        if !leveledData.isEmpty {
            result.append(leveledData)
        }
    }
    return result
}

// Better Implementation
func levelOrderBatterImplementation(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    traverse(root, 0, &result)
    return result
}
   
private func traverse(_ node: TreeNode?, _ level: Int, _ result: inout [[Int]]) {
   guard let node = node else { return }
   
   if level > result.count - 1 {
       result.append([])
   }
   
   result[level].append(node.val)
   
   traverse(node.left, level + 1, &result)
   traverse(node.right, level + 1, &result)
}

class Queue<T> {
    var arr: [T]
    
    init() {
        arr = []
    }
    
    func enqueue(_ data: T) {
        arr.append(data)
    }
    
    func dequeue() -> T? {
        return arr.removeFirst()
    }
    var isEmpty: Bool {
        return arr.isEmpty
    }
}


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

// [3,9,20,null,null,15,7]
var ex1 = TreeNode(3,
                   TreeNode(9),
                   TreeNode(20,
                            TreeNode(15), TreeNode(7)))

var resultEx1 = levelOrder(ex1)
print(resultEx1)

// [1,2,3,4,null,null,5]
var ex2 = TreeNode(1,
                   TreeNode(2,
                            TreeNode(4), nil),
                   TreeNode(3,
                            nil, TreeNode(5)))

var resultEx2 = levelOrder(ex2)
print(resultEx2)
