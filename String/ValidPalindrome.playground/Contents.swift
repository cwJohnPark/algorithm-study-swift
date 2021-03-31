import CoreFoundation

func isPalindrome(_ s: String) -> Bool {
    var charArray: [Character] = []
    // eliminate non alphanumeric
    let startTime = CFAbsoluteTimeGetCurrent()

    for chr in s {
        if chr.isLetter || chr.isNumber {
            charArray.append(contentsOf: chr.lowercased())
        }
    }
    let endTime = CFAbsoluteTimeGetCurrent()
    
    print(endTime - startTime)
    for i in 0..<charArray.count/2 {
        if charArray[i] != charArray[charArray.count-1-i] {
            return false
        }
    }
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))



func isPalindromeSlow(_ s: String) -> Bool {
    var charArray: [Character] = []
    // eliminate non alphanumeric
    let startTime = CFAbsoluteTimeGetCurrent()
    for index in 0..<s.count {
        let chr = s[s.index(s.startIndex, offsetBy: index)]
        if chr.isLetter || chr.isNumber {
            charArray.append(contentsOf: chr.lowercased())
        }
    }
    let endTime = CFAbsoluteTimeGetCurrent()
    
    print(endTime - startTime)
    for i in 0..<charArray.count/2 {
        if charArray[i] != charArray[charArray.count-1-i] {
            return false
        }
    }
    return true
}

print(isPalindromeSlow("A man, a plan, a canal: Panama"))
print(isPalindromeSlow("race a car"))

