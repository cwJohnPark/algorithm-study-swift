/*
 * Check Balanced
 * Implement a function to check if a binary tree is balanced
 * A balanced tree is defined to be a tree
 * such that the heights of the two subtrees of any node never differ by more than one
 */


class TreeNode<T> {
    var data: T
    var left: TreeNode?
    var right: TreeNode?
    init(_ data: T) { self.data = data }
    init(_ data: T, _ left: TreeNode?, _ right: TreeNode?) {
        self.data = data
        self.left = left
        self.right = right
    }
}

func isBalanced(_ root: TreeNode<Int>?) -> Bool {
    return checkHeight(root) != Int.min
}

func checkHeight(_ root: TreeNode<Int>?) -> Int {
    guard let rootNode = root else {
        return -1
    }
    
    let leftHeight = checkHeight(rootNode.left)
    if leftHeight == Int.min {
        return Int.min
    }
    
    let rightHeight = checkHeight(rootNode.right)
    if rightHeight == Int.min {
        return Int.min
    }
    
    let heightDiff = leftHeight - rightHeight
    
    if abs(heightDiff) > 1{
        return Int.min
    } else {
        return max(leftHeight, rightHeight) + 1
    }
    
}
