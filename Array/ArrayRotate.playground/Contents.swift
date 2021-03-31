// 1. Pop and Push one by one
func rotate_popAndPush(_ nums: inout [Int], _ k: Int) {
    for _ in 0..<k {
        if let last = nums.popLast() {
            nums.insert(last, at: 0)
        }
    }
}

var mat = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]
rotate_popAndPush(&mat[0], 2)
//print(mat[0]) // 4,5,1,2,3

rotate_popAndPush(&mat[1], 5)
//print(mat[1]) // 6,7,8,9,10


// 2. Reverse
func rotate_reverse(_ nums: inout [Int], _ k: Int) {
    guard nums.count > 1 else { return }
    let k2 = k%nums.count
    if k2 == 0 { return }
    // reverse left section
    let leftSectionLastIndex = nums.count-k2-1
    
    reverse(&nums, startIdx: 0, endIdx: leftSectionLastIndex)
    // reverse right section
    let rightSectionStartIndex = (leftSectionLastIndex+1) % nums.count
    reverse(&nums, startIdx: rightSectionStartIndex, endIdx: nums.count-1)
    
    nums.reverse()
}

func reverse(_ nums: inout [Int], startIdx: Int, endIdx: Int) {
    for i in 0...(endIdx-startIdx)/2 {
        nums.swapAt(startIdx+i, endIdx-i)
    }
}


// TEST

var arr1 = [1,2,3,4,5,6,7]
rotate_reverse(&arr1, 1) // [7,1,2,3,4,5,6]
print(arr1)

arr1 = [1,2,3,4,5,6,7]
rotate_reverse(&arr1, 3) // [5,6,7,1,2,3,4]
print(arr1)

var arr2 = [1,2]
rotate_reverse(&arr2, 2) // [1,2]
print(arr2)

arr2 = [1,2]
rotate_reverse(&arr2, 1) // [2,1]
print(arr2)

