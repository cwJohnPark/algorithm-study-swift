func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    let nums1Copy = Array(nums1)
    
    var p1 = 0, p2 = 0
    
    for i in 0..<m+n {
        if p2 >= n || (p1 < m && nums1Copy[p1] < nums2[p2]) {
            nums1[i] = nums1Copy[p1]
            p1 += 1
        } else {
            nums1[i] = nums2[p2]
            p2 += 1
        }
    }
}

var nums1: [Int], nums2: [Int]

nums1 = [1,2,3,7,0,0,0]
nums2 = [2,5,6]
merge(&nums1, 4, nums2, 3)
print(nums1) // 1,2,2,3,5,6,7

nums1 = [1]
nums2 = []
merge(&nums1, 1, nums2, 0)
print(nums1) // 1

nums1 = [1,2,3,0,0,0]
nums2 = [2,5,6]
merge(&nums1, 3, nums2, 3)
print(nums1) // 1,2,2,3,5,6


