public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
extension ListNode {
    func strings() -> String {
        if let nextNode = next {
            return "\(val) -> \(nextNode.strings())"
        } else {
            return "\(val)"
        }
    }
}
extension ListNode {
    static func from(arr: [Int]) -> ListNode? {
        var node = ListNode(0)
        let head = node
        for element in arr {
            let newNode = ListNode(element)
            node.next = newNode
            node = newNode
        }
        return head.next
    }
}

// Implementation
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let MAX_LENGTH = 50
    
    if l1 == nil {
        return l2
    } else if l2 == nil {
        return l1
    }
    
    var node1 = l1
    var node2 = l2
    
    // Append dummy head in the merged list
    var merged = ListNode(0)
    let head = merged
    
    var remainingList: ListNode?
    
    for _ in 0..<(MAX_LENGTH*2) { // beaware the number of iterate should be 2 * MAX_LENGTH
        guard let n1 = node1, let n2 = node2 else {
            remainingList = node1 != nil ? node1 : node2 != nil ? node2 : nil
            break
        }
        
        let nextNode: ListNode
        
        if n1.val < n2.val {
            nextNode = ListNode(n1.val)
            node1 = n1.next
        } else {
            nextNode = ListNode(n2.val)
            node2 = n2.next
        }
        
        merged.next = nextNode
        merged = nextNode
        
    }

    // exhaust remainingList
    while let node = remainingList {
        let nextNode = ListNode(node.val)
        merged.next = nextNode
        merged = nextNode
        remainingList = node.next
    }
    
    return head.next // except head
}

var l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
var l2 = ListNode(1, ListNode(5, ListNode(6, ListNode(7))))
var merged: ListNode?
//merged = mergeTwoLists(l1, l2)
//print(merged!.strings()) // 1 -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7

l1 = ListNode(1, ListNode(8))
l2 = ListNode(1, ListNode(5, ListNode(6, ListNode(7))))
//merged = mergeTwoLists(l1, l2)
//print(merged!.strings()) // 1 -> 5 -> 6 -> 7 -> 8

l1 = ListNode(1, ListNode(2))
l2 = ListNode(3, ListNode(5, ListNode(6, ListNode(7))))
//merged = mergeTwoLists(l1, l2)
//print(merged!.strings()) // 1 -> 2 -> 3 -> 5 -> 6 -> 7 -> 8

l1 = ListNode(3, ListNode(5, ListNode(6, ListNode(7))))
l2 = ListNode(1, ListNode(2))
//merged = mergeTwoLists(l1, l2)
//print(merged!.strings()) // 1 -> 2 -> 3 -> 5 -> 6 -> 7 -> 8

// case when parameters are null
//print(mergeTwoLists(nil, nil)) // nil
//print(mergeTwoLists(nil, l2)!.strings()) // 1 -> 2
//print(mergeTwoLists(l2, nil)!.strings()) // 1 -> 2


l1 = ListNode(1, ListNode(5, ListNode(6, ListNode(8))))
l2 = ListNode(2, ListNode(3, ListNode(9)))
//merged = mergeTwoLists(l1, l2)
//print(merged!.strings()) // 1 -> 2 -> 3 -> 5 -> 6 -> 8 -> 9

let list1 = [-30,-27,-27,-23,-23,-22,-21,-21,-19,-19,-16,-16,-15,-13,-9,-9,-5,-5,-3,-2,0,5,5,6,6,7,7,8,9,9,11,11,12,16,20,22,23,23,24,25,25,26]
let list2 = [-25,-25,-22,-20,-18,-17,-11,-2,-2,5,9,13,21,28,28,29]

merged = mergeTwoLists(ListNode.from(arr: list1), ListNode.from(arr: list2))
//print(merged!.strings())


