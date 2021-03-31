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
func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return helper(arr: nums, 0, nums.count)
}
func helper(arr: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    if left >= right {
        return nil
    }
    let mid = (left+right) / 2
    let root = TreeNode(arr[mid])
    root.left = helper(arr: arr, left, mid)
    root.right = helper(arr: arr, mid+1, right)
    return root
}
var result: TreeNode!
result = sortedArrayToBST([-10,3])
print("\ncase1")
print(result.val) // 3
print(result.left!.val) // -10
print(result.right == nil) // nil

result = sortedArrayToBST([-10,3,0,5,9])
print("\ncase2")
print(result.val) // 0
print(result.left!.val) // 3
print(result.left!.left!.val) // -10
print(result.left!.right == nil) // nil

print(result.right!.val) // 9


