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
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    guard let root = root else {
        return result
    }
    
    var queue = [TreeNode]()
    
    queue.append(root)
    var level = 0
    
    while !queue.isEmpty {
        let queueLength = queue.count
        result.append(Array<Int>())
        for _ in 0..<queueLength {
            let node = queue.removeFirst()
            result[level].append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        level+=1
    }
    return result
}

// MARK: - Test
var node1: TreeNode?
node1 = TreeNode.from([1,2,2,3,4,4,3])
print(levelOrder(node1)) // [[1],[2,2],[3,4,4,3]]
node1 = TreeNode.from([1,2,2,nil,3,nil,3])
print(levelOrder(node1)) // [[1],[2,2],[3,3]]



