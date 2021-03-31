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

func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil {
        return true
    }
    var first = head
    
    var reversed = reverseList(getMiddle(head))
    var result = true
        
    while let secondHalf = reversed, let firstHalf = first {
        if (secondHalf.val != firstHalf.val) {
            result = false
        }
        reversed = secondHalf.next
        first = firstHalf.next
    }
    return result
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var before: ListNode? = nil
    var n = head
    while let node = n {
        let nextNode = node.next
        node.next = before
        before = n
        n = nextNode
    }
    return before
}
func getMiddle(_ node: ListNode?) ->  ListNode? {
    var fast = node
    var slow = node
    while let fastNode = fast, let slowNode = slow {
        fast = fastNode.next?.next
        slow = slowNode.next
    }
    
    return slow
}

//print(getMiddle(ListNode.from(arr: [1,2,3,4,5]))?.strings()) // 4->5
//print(getMiddle(ListNode.from(arr: [1,2,3,4]))?.strings()) // 3->4
//print(reverseList(ListNode.from(arr: [1,2,3,4,5]))?.strings()) // 5->4->3->2->1
print(isPalindrome(ListNode.from(arr: [1,2,3,4,5]))) // false
print(isPalindrome(ListNode.from(arr: [5,4,3,4,5]))) // true
print(isPalindrome(ListNode.from(arr: [5,5]))) // true
print(isPalindrome(ListNode.from(arr: [5]))) // true
print(isPalindrome(ListNode.from(arr: [4,5]))) // false
print(isPalindrome(ListNode.from(arr: [1,2,2,1]))) // true
