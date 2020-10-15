/*
 * List of Depths
 * Given a binary tree,
 * design an algorithm which creates a linked list of all the nodes at each depth
 * (e.g., if you have a tree with depth D, you will have D linked lists).
 */

/*
 * Depth-first search
 * pre-order traversal
 */
func createLevelLinkedList(_ root: TreeNode<Int>) -> Array<LinkedList<TreeNode<Int>>> {
    var lists = Array<LinkedList<TreeNode<Int>>>()
    createLevelLinkedList_DFS(root, &lists, 0)
    return lists
}

func createLevelLinkedList_DFS(_ root: TreeNode<Int>?, _ lists: inout Array<LinkedList<TreeNode<Int>>>, _ level: Int) {
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
    createLevelLinkedList_DFS(rootNode.left, &lists, level + 1)
    createLevelLinkedList_DFS(rootNode.right, &lists, level + 1)
    
}

/*
 * Breadth-first search
 */
func createLevelLinkedList_BFS(_ root: TreeNode<Int>) -> Array<LinkedList<TreeNode<Int>>> {
    var result = Array<LinkedList<TreeNode<Int>>>()
    
    var current = LinkedList<TreeNode<Int>>()
    // add root
    current.add(root)
    
    while current.count > 0 {
        
        result.append(current)
        
        let parents = current
        current = LinkedList<TreeNode<Int>>()
        for index in 0 ..< parents.count {
            
            let parent = parents.get(at: index)
            
            if let left = parent?.data.left {
                current.add(left)
            }
            if let right = parent?.data.right {
                current.add(right)
            }
            
        }
    }
    
    return result
}

/*
 * Breadth-first Search Using Array
 */
func createLevelArrayList_BFS(_ root: TreeNode<Int>) -> Array<Array<TreeNode<Int>>> {
    var result = Array<Array<TreeNode<Int>>>()
    
    var current = Array<TreeNode<Int>>()
    // add root
    current.append(root)
    
    while current.count > 0 {
        
        result.append(current)
        
        let parents = current
        current = Array<TreeNode<Int>>()
        
        for parent in parents {
                        
            if let left = parent.left {
                current.append(left)
            }
            if let right = parent.right {
                current.append(right)
            }
            
        }
    }
    
    return result
}


class LinkedList<T> {
    var head: LinkedListNode<T>?
    
    var count: Int {
        guard var root = head else {
            return 0
        }
        var count = 1
        
        while let n = root.next {
            root = n
            count += 1
        }
        return count
    }
    
    func get(at index: Int) -> LinkedListNode<T>? {
        var count = 0
        var currentNode = head
        
        while count < index && currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        
        return currentNode
        
    }
    
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
 * ex1 - DFS
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


/*
 * ex2 - BFS
 * input: 1 - 2, 5 - 3, 4, 6, 7
 * output: [1,[2,5],[3,4,6,7]]
 */
var ex2_tree = TreeNode(1,
                        TreeNode(2,
                                 TreeNode(3), TreeNode(4)),
                        TreeNode(5,
                                 TreeNode(6), TreeNode(7)))

var result_ex2 = createLevelArrayList_BFS(ex2_tree)
for list in result_ex2 {
    for node in list {
        print(node.data, terminator: " ")
    }
    print()
}
