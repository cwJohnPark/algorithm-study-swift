public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}
 
func deleteNode(_ node: ListNode?) {
    if let n = node, let next = n.next {
        n.val = next.val
        n.next = next.next
    }
}

var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
node1.next = node2
node2.next = node3
node3.next = node4

deleteNode(node2)

print(node1.next?.val) // 3
print(node2.val) // 3
print(node3.val) // 3
print(node3.next?.val) // 4

