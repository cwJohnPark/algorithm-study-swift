/*
 * Pre-order Traversal
 * visit the root first then, traverse the left subtree. Finally, traverse the right subtree
 */

// Given the root of a binary tree, return the preorder traversal of its nodes'values


//Definition for a binary tree node.
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

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let node = root else {
        return []
    }
    var traversed: [Int] = []
    traversed.append(node.val)
    traversed.append(contentsOf: preorderTraversal(node.left))
    
    traversed.append(contentsOf: preorderTraversal(node.right))
    
    return traversed
}

/*
 *  Ex1
 *  Input : root = [1,null,2,3]
 *  Output : [1,2,3]
 */
var ex1RightLeft = TreeNode(3)
var ex1Right = TreeNode(2, ex1RightLeft, nil)
var ex1 = TreeNode(1, nil, ex1Right)
print(preorderTraversal(ex1))

/*
 * Ex2
 * Input: root = []
 * Output: []
 */

print(preorderTraversal(nil))

/*
 * Ex3
 * Input: root = [1]
 * Output: [1]
 */
print(preorderTraversal(TreeNode(1)))


/*
 * Ex4
 * Input: root = [1,2]
 * Output: [1,2]
 */
var ex4Left = TreeNode(2)
var ex4 = TreeNode(1, ex4Left, nil)
print(preorderTraversal(ex4))

/*
 * Ex5
 * Input: root = [1,null, 2]
 * Output: [1,2]
 */
var ex5Right = TreeNode(2)
var ex5 = TreeNode(1, nil, ex5Right)
print(preorderTraversal(ex5))

