
import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var insertIdx = 0;
    for i in 0..<nums.count {
        if (nums[i] != 0) {
            nums.swapAt(insertIdx, i)
            insertIdx += 1
        }
    }
}

// better solution
func moveZeroes_better(_ nums: inout [Int]) {
    var idx = 0
    for e in nums {
        if e != 0 {
            nums[idx] = e
            idx += 1
        }
    }
    for i in idx ..< nums.count {
        nums[i] = 0
    }
}

var nums = [0,1,0,3,12]
moveZeroes(&nums)
print(nums)
