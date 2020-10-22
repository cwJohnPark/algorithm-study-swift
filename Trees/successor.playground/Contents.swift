/*
 * Write an algorithm to find the 'next' node(in-order successor)
 * of a given node in a binary search tree
 * You may assume that each node has a link to its parent
 */

func inOrderSuccessor(_ n: TreeNode<Int>?) -> TreeNode<Int>? {
    guard let rootNode = n else {
        return nil
    }
    
    // If n has a right subtree
    if let rightNode = rootNode.right {
        return leftMostChild(rightNode)
    }
    
    // If n does not have a right subtree,
    // Go up until we're on left instead of right
    var child = rootNode;
    var parent = child.parent;
    while parent != nil && parent?.left !== child {
        child = parent!
        parent = parent?.parent
    }
    return parent;
}

func leftMostChild(_ n: TreeNode<Int>?) -> TreeNode<Int>? {
    guard var node = n else {
        return nil
    }
    
    while let left = node.left {
        node = left
    }
    
    return node
    
}


class TreeNode<T> {
    var data: T
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    init(_ data: T) { self.data = data }
    init(_ data: T, _ left: TreeNode?, _ right: TreeNode?) {
        self.data = data
        self.left = left
        self.right = right
    }
}


