func containsDuplicate(_ nums: [Int]) -> Bool {
    var set = Set<Int>()
    
    for num in nums {
        if set.contains(num) {
            return true
        } else {
            set.insert(num)
        }
    }
    return false
}


print(containsDuplicate([1,2,3,1])) // true
print(containsDuplicate([1,2,3,4])) // false
print(containsDuplicate([1,1,1,3,3,4,3,2,4,2])) // true


