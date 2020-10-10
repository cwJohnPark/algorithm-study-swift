
/*
 * Post-order Traversal
 * Visit the left subtree first. Then traverse the right subtree.
 * Finally, traverse the root.
 */

// Given the root of a binary tree, return the postorder traversal of its nodes'values


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


func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let node = root else {
        return []
    }
    
    var traversed = postorderTraversal(node.right)
    traversed.append(contentsOf: postorderTraversal(node.left))
    traversed.append(node.val)
    
    return traversed
}



/*
 *  Ex1
 *  Input : root = [1,null,2,3]
 *  Output : [3,2,1]
 */
var ex1RightLeft = TreeNode(3)
var ex1Right = TreeNode(2, ex1RightLeft, nil)
var ex1 = TreeNode(1, nil, ex1Right)
print(postorderTraversal(ex1))


/*
 * Ex2
 * Input: root = []
 * Output: []
 */

print(postorderTraversal(nil))

/*
 * Ex3
 * Input: root = [1]
 * Output: [1]
 */
print(postorderTraversal(TreeNode(1)))


/*
 * Ex4
 * Input: root = [1,2]
 * Output: [2,1]
 */
var ex4Left = TreeNode(2)
var ex4 = TreeNode(1, ex4Left, nil)
print(postorderTraversal(ex4))

/*
 * Ex5
 * Input: root = [1,null, 2]
 * Output: [2,1]
 */
var ex5Right = TreeNode(2)
var ex5 = TreeNode(1, nil, ex5Right)
print(postorderTraversal(ex5))


