//Given two strings s and t , write a function to determine if t is an anagram of s.
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var table: [UInt8:Int] = [:]
    
    for char in s {
        if let i = char.asciiValue {
             print("\(char) : \(String(describing: table[i]))")
            table[i] = (table[i] ?? 0) + 1
        }
    }
    
    for char in t {
        if let i = char.asciiValue {
            table[i] = (table[i] ?? 0) - 1
            if (table[i] ?? 0) < 0 {
                return false
            }
        }
        
    }
    return true
}

func isAnagramTheOther(_ s: String, _ t: String) -> Bool {
    var count = Array(repeating: 0, count: 26)
    let a = Int(UnicodeScalar("a").value)
    for char in s.unicodeScalars {
      count[Int(char.value) - a] += 1
    }

    for char in t.unicodeScalars {
      count[Int(char.value) - a] -= 1
    }

    for i in count {
      if i != 0 {
          return false
      }
    }
    return true
}

var result: Bool
//result = isAnagram("anagram", "nagaram")
//print(result)

result = isAnagram("aacc", "ccac")
print(result)
