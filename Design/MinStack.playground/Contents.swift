class MinStack {

    var arr: [Int] = [Int]()
    var minArr: [Int] = [Int]()
    
    init() {
    }
    
    func push(_ x: Int) {
        arr.append(x)
        minArr.append(min(getMin(), x))
    }
    
    func pop() {
        arr.removeLast()
        minArr.removeLast()
    }
    
    func top() -> Int {
        return arr.last!
    }
    
    func getMin() -> Int {
        return minArr.last ?? Int.max
    }
}

/**
 * Your MinStack object will be instantiated and called as such
 */

let obj = MinStack()
obj.push(5)
obj.push(10)
obj.push(6)
obj.pop()
obj.push(11)
print(obj.top()) // 11
print(obj.getMin()) //5
