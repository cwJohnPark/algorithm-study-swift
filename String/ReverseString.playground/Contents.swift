func reverseString(_ s: inout [Character]) {
    for i in 0..<s.count/2 {
        s.swapAt(i, s.count-1-i)
    }
}

var s: [Character] = ["h","e","l","l","o"]
reverseString(&s)
print(s)
