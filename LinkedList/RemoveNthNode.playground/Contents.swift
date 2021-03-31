//  Remove Nth Node From End of List


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
 
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var node = head
    var newHead = node
    // 리스트의 길이
    let length = getLength(head)
    
    // 첫번째 노드가 지워야할 노드일 때
    if length-n-1 < 0 {
        node = node?.next
        newHead = node
    } else {
        for _ in 0..<length-n-1 {
            node = node?.next
        }
        node?.next = node?.next?.next
    }

    return newHead
}

func getLength(_ head: ListNode?) -> Int {
    guard var n = head else {
        return 0
    }
    var length = 1
    while let nn = n.next {
        length += 1
        n = nn
    }
    return length
}

let n1 = ListNode(1)
let n2 = ListNode(2)
let n3 = ListNode(3)
let n4 = ListNode(4)
let n5 = ListNode(5)

//case 1
n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
print(n1.print())
let n1Result = removeNthFromEnd(n1, 2)
print(n1Result!.print())

// case 2
n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
let n2Result = removeNthFromEnd(n1, 1)
print(n2Result!.print())

// case3
let nn1 = ListNode(1)

let nn1Result = removeNthFromEnd(nn1, 1)
print(nn1Result?.print())

// case4
let nn2 = ListNode(1)
nn2.next = ListNode(2)
let nn2Result = removeNthFromEnd(nn2, 2)
print(nn2Result!.print())

// case 5
let case5Result = removeNthFromEnd(nn2, 1)
print(case5Result!.print())

