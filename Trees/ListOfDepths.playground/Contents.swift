/*
 * List of Depths
 * Given a binary tree,
 * design an algorithm which creates a linked list of all the nodes at each depth
 * (e.g., if you have a tree with depth D, you will have D linked lists).
 */

/*
 * pre-order traversal
 */
func createLevelLinkedList(_ root: TreeNode<Int>) -> Array<LinkedList<TreeNode<Int>>> {
    var lists = Array<LinkedList<TreeNode<Int>>>()
    createLevelLinkedList(root, &lists, 0)
    return lists
}

func createLevelLinkedList(_ root: TreeNode<Int>?, _ lists: inout Array<LinkedList<TreeNode<Int>>>, _ level: Int) {
    guard let rootNode = root else {
        return;
    }
    
    var list:LinkedList<TreeNode<Int>>
    
    if lists.count == level {
        list = LinkedList<TreeNode<Int>>()
        lists.append(list)
    } else {
        list = lists[level]
    }
    list.add(rootNode)
    createLevelLinkedList(rootNode.left, &lists, level + 1)
    createLevelLinkedList(rootNode.right, &lists, level + 1)
    
}


class LinkedList<T> {
    var head: LinkedListNode<T>?
    
    func add(_ node: T) {
        guard var nextNode = head else {
            head = LinkedListNode(node)
            return
        }
        
        while let n = nextNode.next {
            nextNode = n
        }
        nextNode.next = LinkedListNode(node)
    }
}

class LinkedListNode<T> {
    var data: T
    var next: LinkedListNode?
    init(_ data: T) {
        self.data = data
    }
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
 * input: 1 - 2, 5 - 3, 4, 6, 7
 * output: [1,[2,5],[3,4,6,7]]
 */
var ex1_tree = TreeNode(1,
                        TreeNode(2,
                                 TreeNode(3), TreeNode(4)),
                        TreeNode(5,
                                 TreeNode(6), TreeNode(7)))

var result_ex1 = createLevelLinkedList(ex1_tree)
for linkedList in result_ex1 {
    var current = linkedList.head
    while let n = current {
        print(n.data.data, terminator:" ")
        current = n.next
    }
    print()
}


