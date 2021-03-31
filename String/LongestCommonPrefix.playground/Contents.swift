func longestCommonPrefix(_ strs: [String]) -> String {
    guard !strs.isEmpty else {
        return ""
    }
    return strs.reduce(strs[0], merge)
}

func merge(_ str1: String, _ str2: String) -> String {
    let length = str1.count < str2.count ? str1.count : str2.count
    let arr1 = Array(str1)
    let arr2 = Array(str2)
    var commonLength = 0
    for i in 0..<length {
        if (arr1[i] != arr2[i]) {
            break;
        }
        commonLength+=1
    }
    return String(arr1[0..<commonLength])
}

print(merge("abc", "ab"))
print(merge("flower", "flow"))

print(longestCommonPrefix(["flower","flow","flight"])) //fl
print(longestCommonPrefix(["dog","racecar","car"])) // ""
print(longestCommonPrefix(["dog","doracecar","dcar"])) // d
print(longestCommonPrefix(["dog"])) // dog
print(longestCommonPrefix([])) // ""

