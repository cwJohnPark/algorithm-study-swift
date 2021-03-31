func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty {
        return 0
    }
    
    let length = needle.count
    let s1Array = Array(haystack)
    let s2Array = Array(needle)
    
    for i in 0 ..< s1Array.count {
        if i+length > s1Array.count {
            return -1
        }
        if Array(s1Array[i..<(i+length)]) == s2Array {
            return i
        }
    }
    return -1
}

strStr("abcd", "bc")
