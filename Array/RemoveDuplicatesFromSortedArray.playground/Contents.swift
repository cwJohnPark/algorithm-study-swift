func removeDuplicates(_ nums: inout [Int]) -> Int {
    var replacedIdx = 0
    for i in 0..<nums.count {
        if nums[i] != nums[replacedIdx] {
            replacedIdx += 1
            nums[replacedIdx] = nums[i]
        }
    }
    return replacedIdx+1
}

var input1 = [0,0,1,1,1,2,2,3,3,4]
print(removeDuplicates(&input1)) // 5
print(input1) // 0,1,2,3,4...

var input2: [Int] = []
print(removeDuplicates(&input2)) // 0

var input3: [Int] = [1,1,2]
print(removeDuplicates(&input3)) // 2
print(input3) // [1,2,2]
