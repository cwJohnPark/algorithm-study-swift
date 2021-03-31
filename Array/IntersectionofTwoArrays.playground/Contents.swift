func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    guard nums1.count > 0 && nums2.count > 0 else { return [] }
    
    var nums1Dict = [Int: Int]()
    var result = [Int]()
    
    for num1 in nums1 {
        var added = 1
        if let val = nums1Dict[num1] {
            added += val
        }
        nums1Dict.updateValue(added, forKey: num1)
    }
    for num2 in nums2 {
        if let val = nums1Dict[num2], val > 0 {
            result.append(num2)
            nums1Dict.updateValue(val-1, forKey: num2)
        }
        
    }
    
    return result
}



print(intersect([1,2,2,1], [2,2]))
print(intersect([1,2,2,1], [2,1]))
