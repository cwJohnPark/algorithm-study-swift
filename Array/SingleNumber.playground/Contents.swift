func singleNumber(_ nums: [Int]) -> Int {
    var buf = 0
    for num in nums {
        buf = buf ^ num
    }
    return buf
}

print(singleNumber([4,5,1,5,1])) // 4
print(singleNumber([2,2,1])) // 1
print(singleNumber([1])) // 1


