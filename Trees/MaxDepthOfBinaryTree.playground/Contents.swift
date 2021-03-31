

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
 
func maxDepth(_ root: TreeNode?) -> Int {
    guard let rootNode = root else {
        return 0
    }
    var stack = [TreeNode]()
    var depths = [Int]()
    var depth = 0
    
    stack.append(rootNode)
    depths.append(1)
    
    while !stack.isEmpty {
        
        if let lastNode = stack.popLast(), let currentDepth = depths.popLast() {
            depth = max(depth, currentDepth)
            if let left = lastNode.left {
                stack.append(left)
                depths.append(currentDepth+1)
            }
            if let right = lastNode.right {
                stack.append(right)
                depths.append(currentDepth+1)
            }
        }
    }
    return depth
}

var depth = maxDepth(TreeNode(1,
                  TreeNode(2,
                           TreeNode(4, TreeNode(5), nil), nil),
                  TreeNode(3))) // 3
//print(depth) // 3
//print(maxDepth(nil)) // 0

//var list = [3,9,20,nil,nil,15,7]
//TreeNode.from(list)

depth = maxDepth(TreeNode(3,
                  TreeNode(9),
                  TreeNode(20,
                           TreeNode(15), TreeNode(7))))
//print(depth) // 3

var node1 = TreeNode.from([1,2,3,4,5,6])
var node2 = TreeNode.from([1,2,3,nil,nil,5,6])
