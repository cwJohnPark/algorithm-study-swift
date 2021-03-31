func missingNumber(_ nums: [Int]) -> Int {
    let count = nums.count
    let sum = (count * (count + 1)) / 2
    let subtract = nums.reduce(0,+)
    
    return sum - subtract
}

print(missingNumber([0,1,2,3,4,5])) // 6
print(missingNumber([3,0,1])) // 2
print(missingNumber([9,6,4,2,3,5,7,0,1])) // 8
print(missingNumber([0])) // 1
