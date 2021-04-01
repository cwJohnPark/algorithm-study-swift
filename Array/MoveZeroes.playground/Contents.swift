func moveZeroes(_ nums: inout [Int]) {
    let size = nums.count
    var j = 0
    
    for i in 0..<size {
        if nums[i] != 0 {
            nums.swapAt(i, j)
            j += 1
        }
    }
}

var arr1: [Int]
arr1 = [0,1,0,3,12]
moveZeroes(&arr1)
print(arr1)

arr1 = [0]
moveZeroes(&arr1)
print(arr1)
