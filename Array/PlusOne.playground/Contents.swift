func plusOne(_ digits: [Int]) -> [Int] {
    var result = [Int]()
    let size = digits.count
    
    var val = digits[size-1] + 1
    result.append(val % 10)
    
    var carry = val / 10
    
    for i in 1..<size {
        val = digits[size-1-i] + carry
        carry = val / 10
        val = val % 10
        result.append(val)
    }
    if carry == 1 {
        result.append(1)
    }
    
    return result.reversed()
}

print(plusOne([1,2,3])) //[1,2,4]
print(plusOne([9])) //[1,0]
print(plusOne([0])) //[1]

