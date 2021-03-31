
class Solution {
    
    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        return nums.shuffled()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */

let obj = Solution([1,2,3])
print(obj.shuffle())
print(obj.reset())

