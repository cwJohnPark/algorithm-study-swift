func maxSubArray(_ nums: [Int]) -> Int {
    var numsCopy = nums
    var maxSum = numsCopy[0]
    
    for i in 1..<numsCopy.count {
        if numsCopy[i-1] > 0 {
            numsCopy[i] += numsCopy[i-1]
        }
        maxSum = max(maxSum, numsCopy[i])
        
    }
    return maxSum
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
