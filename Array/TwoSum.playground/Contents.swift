func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for idx in 0..<nums.count {
        map[nums[idx]] = idx
    }
    
    for idx in 0..<nums.count {
        if let subtract = map[target - nums[idx]] {
            if subtract != idx {
                return [idx,subtract]
            }
        }
    }
    
    return []
}
// the other solution
func twoSum_other(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int:Int]()
    for (i,num) in nums.enumerated(){
        if let lastIndex = dict[target-num]{
            return [lastIndex,i]
        }
        dict[num] = i
    }
    print("not find")
    return [-1]
}

twoSum([2,7,11,15], 9) // 0,1

twoSum([3,2,4], 6) // 1,2

twoSum([3,3], 6) // 0, 1
