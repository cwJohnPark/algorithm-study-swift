public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
extension ListNode {
    func print() -> String {
        if let nextNode = next {
            return "\(val) -> \(nextNode.print())"
        } else {
            return "\(val)"
        }
    }
}
 
func reverseList(_ head: ListNode?) -> ListNode? {
    var node = head
    var before: ListNode? = nil
    
    while let n = node {
        let next = n.next
        n.next = before
        before = node
        node = next
    }
    return before
}

let n1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print(n1.print())

let reversed = reverseList(n1)
print(reversed!.print())

