// MARK: - Definition
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
extension TreeNode {
    static func from(_ arr: [Int?]) -> TreeNode? {
        guard let firstElement = arr[0] else {
            return nil
        }
        let root = TreeNode(firstElement)
        var queue = [TreeNode]()
        queue.append(root)
        
        var index = 1
        while !queue.isEmpty && index < arr.count {
            
            let node = queue.removeFirst()
            if let leftVal = arr[index] {
                let left = TreeNode(leftVal)
                node.left = left
                queue.append(left)
            }
            if index+1 < arr.count, let rightVal = arr[index+1]{
                let right = TreeNode(rightVal)
                node.right = right
                queue.append(right)
            }
            index += 2
        }
        
        return root
    }
    
}

// MARK: - Answer
func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return false
    }
    
    var queue = [BinarySearchTreeNode]()
    queue.append(BinarySearchTreeNode(node: root, min: Int.min, max: Int.max))
    
    while !queue.isEmpty {
        let binNode = queue.removeFirst()
        let currentNode = binNode.node
        //print("node : \(binNode.node.val), left : \(currentNode.left?.val), right : \(currentNode.right?.val), min: \(binNode.min), max: \(binNode.max)")
        if binNode.min >= currentNode.val || binNode.max <= currentNode.val {
            return false
        }
        
        if let leftNode = currentNode.left {
            queue.append(BinarySearchTreeNode(node: leftNode, min: binNode.min, max: currentNode.val))
        }
        if let rightNode = currentNode.right {
            queue.append(BinarySearchTreeNode(node: rightNode, min: currentNode.val, max: binNode.max))
        }
        
    }
    return true
}
public struct BinarySearchTreeNode {
    let node: TreeNode
    let min: Int
    let max: Int
}

// MARK: - Test
var node1: TreeNode?
node1 = TreeNode.from([5,4,6,nil,nil,3,7])
print(isValidBST(node1)) // false

node1 = TreeNode.from([2,1,3])
print(isValidBST(node1)) // true

node1 = TreeNode.from([5,1,4,nil,nil,3,6])
print(isValidBST(node1)) // false

node1 = TreeNode.from([1])
print(isValidBST(node1)) // true

