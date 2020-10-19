/*
 * Validate BST
 * Implement a function to check if a binary tree is a binary search tree
 */

var last_printed: Int? = nil

func checkBST(_ root: TreeNode<Int>?) -> Bool {
    guard let rootNode = root else {
        return true
    }
    
    if checkBST(rootNode.left) == false {
        return false
    }
    if let lastVal = last_printed {
        if lastVal >= rootNode.data {
            return false
        }
    }
    last_printed = rootNode.data
    
    if checkBST(rootNode.right) == false {
        return false
    }
    
    // All good!
    return true
    
}

/*
 * Min-max solution
 */
func checkBST_2(_ n: TreeNode<Int>?) -> Bool {
    return checkBST_2_helper(n, nil, nil)
}
func checkBST_2_helper(_ n: TreeNode<Int>?, _ min: Int?, _ max: Int?) -> Bool {
    guard let rootNode = n else {
        return true
    }
    
    if let minValue = min {
        if rootNode.data <= minValue {
            return false
        }
    }
    if let maxValue = max {
        if rootNode.data > maxValue {
            return false
        }
    }
    
    if checkBST_2_helper(rootNode.left, min, rootNode.data) == false ||
        checkBST_2_helper(rootNode.right, rootNode.data, max) == false {
        return false
    }
    return true
}

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

/*
 * ex1
 * 1-2-3-4-5-6-7
 */
let ex1 = TreeNode(4,
                   TreeNode(2,
                        TreeNode(1), TreeNode(3)),
                   TreeNode(6,
                        TreeNode(5), TreeNode(7)))

let ex1Result = checkBST(ex1)
print(ex1Result)

let ex1Result2 = checkBST_2(ex1)
print(ex1Result2)
