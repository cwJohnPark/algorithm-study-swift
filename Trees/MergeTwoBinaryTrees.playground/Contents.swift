
/*
 * Merge Two Binary Trees
 */

/*
 * Recursive
 */
func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    guard let node1 = t1 else {
        return t2
    }
    guard let node2 = t2 else {
        return t1
    }
    
    node1.val += node2.val
    node1.left = mergeTrees(node1.left, node2.left)
    node1.right = mergeTrees(node1.right, node2.right)
    
    return node1
}

/*
 * Iterative
 */
func mergeTrees_iterative(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    
    // stack
    var stack = Array<(TreeNode?, TreeNode?)>()
    
    // t1 is nil?
    if t1 == nil {
        return t2
    }
    
    // push t1 and t2 root node into the stack
    stack.append((t1, t2))
    
    while !stack.isEmpty {
        
        let (n1, n2) = stack.removeLast()
            
        // t1 and t2 node are nil
        guard let node1 = n1, let node2 = n2 else {
            continue
        }
        
        // t1 node is result node
        node1.val += node2.val
        
        // t1 node left is nil?
        if node1.left != nil {
            // go ahead
            stack.append((node1.left, node2.left))
        } else {
            // t1 node borrows t2 node
            node1.left = node2.left
        }
        
        // t1 node right is nil?
        if node1.right != nil {
            // go ahead
            stack.append((node1.right, node2.right))
        } else {
            // t1 node borrows t2 node
            node1.right = node2.right
        }
        
    }
    
    return t1
}

/*
 * Iterative - Best solution
 */




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

/*
 * ex1
 */
let ex1_t1 = TreeNode(1,
                   TreeNode(3, TreeNode(5), nil),
                   TreeNode(2))
let ex1_t2 = TreeNode(2,
                   TreeNode(1, nil, TreeNode(4)),
                   TreeNode(3, nil, TreeNode(7)))


let ex1_merged = mergeTrees(ex1_t1, ex1_t2)
print("root : \(ex1_merged!.val), left subtree : \(ex1_merged!.left!.val), right subtree: \(ex1_merged!.right!.val)")

