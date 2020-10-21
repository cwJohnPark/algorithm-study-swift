/*
 * Write an algorithm to find the 'next' node(in-order successor)
 * of a given node in a binary search tree
 * You may assume that each node has a link to its parent
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


