func firstUniqChar(_ s: String) -> Int {
    
    var dictionary: [Character: Int] = [:]
    
    for (idx, char) in s.enumerated() {
        if dictionary[char] != nil {
            dictionary[char] = -1
        } else {
            dictionary[char] = idx
        }
    }
    
    for (idx, char) in s.enumerated() {
        if dictionary[char] != -1 {
            return idx
        }
    }
    
    return -1;
}

firstUniqChar("leetcode") // 0
firstUniqChar("loveleetcode") // 2
firstUniqChar("lleeooddi") // 8

