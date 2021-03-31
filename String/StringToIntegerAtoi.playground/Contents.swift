func myAtoi(_ s: String) -> Int {
    var parsed: Int64 = 0
    var isPositive = true
    var strIndex = 0
    // 1. ignore any leading whitespace.
    for i in 0..<s.count {
        if !s[s.index(s.startIndex, offsetBy: i)].isWhitespace {
            strIndex = i
            break
        }
    }
    // print("where to start \(s[s.index(s.startIndex, offsetBy: strIndex)])")
    
    // 2. Check if the next character (if not already at the end of the string) is '-' or '+'
    let nextChar = s[s.index(s.startIndex, offsetBy: strIndex)]
    if nextChar == "-" {
        isPositive = false
        strIndex += 1
    }
    if nextChar == "+" {
        strIndex += 1
    }
    

    // 3. Read in next the characters until the next non-digit charcter or the end of the input is reached. The rest of the string is ignored.
    if !nextChar.isWholeNumber && nextChar != "-" && nextChar != "+" {
        return 0
    }
    
    // 4. Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
    var onlyNum = ""
    
    for i in strIndex..<s.count {
        let digit = s[s.index(s.startIndex, offsetBy: i)]
        if !digit.isWholeNumber {
            break
        }
        onlyNum.append(digit)
    }
    print(onlyNum)
    
    
    // 5. If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
    let minInt = String(Int.min)
    let noSignMinInt = minInt[minInt.index(after: minInt.startIndex)...]
    let maxInt = String(Int.max)
    
    if UInt(onlyNum)! >
        noSignMinInt || onlyNum! > maxInt {
        return 0
    }
    //return (onlyNum >= Int.max || onlyNum < Int.min) ? Int(0) : Int(onlyNum)!;
    return Int(onlyNum) * (isPositive ? +1 : -1)
}

myAtoi("42")
myAtoi(" 42")
myAtoi(" +42")
myAtoi(" -42")
myAtoi(" a42")
myAtoi("  -42 abcd")
