/*
 * Minimal Tree
 * Given a sorted (increasing order) array with unique integer elements,
 * write an algorithm to create a binary search tree with minimal height.
 */

func createMinimalBST(_ arr: [Int]) -> TreeNode<Int>? {
    return createMinimalBST(arr, 0, arr.count-1)
}

func createMinimalBST(_ arr: [Int], _ start: Int, _ end: Int) -> TreeNode<Int>? {
    if start > end {
        return nil
    }
    
    let middle = (end + start) / 2
    
    let middleNode = TreeNode(arr[middle])
    middleNode.left = createMinimalBST(arr, start, middle - 1)
    middleNode.right = createMinimalBST(arr, middle + 1, end)
    
    return middleNode
}


class TreeNode<T> {
    var val: T
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: T) {
        self.val = val
    }
}


/*
 * ex1
 * Input: [0, 1, 2, 3]
 */
var ex1 = [0, 1, 2, 3]
var result_ex1 = createMinimalBST(ex1)!
print(result_ex1.val)
print(result_ex1.left?.val)
print(result_ex1.left?.left?.val)
print(result_ex1.right?.val)
print(result_ex1.right?.left?.val)
print(result_ex1.right?.right?.val)
