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
func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head?.next
    
    while let slowNode = slow, let fastNode = fast {
        if slowNode === fastNode {
            return true
        }
        slow = slowNode.next
        fast = fastNode.next?.next
    }
    return false
    
}

var node1: ListNode, node2: ListNode, node3: ListNode, node4: ListNode
// case 1 head = [1,2], pos = 0
node1 = ListNode(1)
node2 = ListNode(2)
node1.next = node2
node2.next = node2

print(hasCycle(node1)) // true

// case 2 head = [1], pos = -1
node1 = ListNode(1)
print(hasCycle(node1)) // false

// case 3 head = [3,2,0,4], pos = 1
node1 = ListNode(3)
node2 = ListNode(2)
node3 = ListNode(0)
node4 = ListNode(4)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2
print(hasCycle(node1)) // true




