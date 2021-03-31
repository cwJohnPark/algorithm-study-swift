/*
 * Describe how you could use a single array to implement three stacks
 */

class FixedMultiStack {
    var numberOfStacks:Int = 3
    var stackCapacity:Int // the size of the each stack
    var values:[Int] // all elements of the stacks
    var sizes:[Int] // the size of each stack
    
    init(stackSize : Int) {
        self.stackCapacity = stackSize
        self.values = Array.init(repeating: 0, count: numberOfStacks * stackSize)
        self.sizes = Array.init(repeating: 0, count: numberOfStacks)
    }
    
    // push value onto stack
    func push(stackNum:Int, value: Int) throws {
        if isFull(stackNum: stackNum) {
            throw StackOverflowError()
        }
        // increment size
        sizes[stackNum] += 1
        // get offset
        values[getOffset(stackNum: stackNum)] = value
    }
    
    func isFull(stackNum: Int) -> Bool {
        return sizes[stackNum] == stackCapacity
    }
    
    func getOffset(stackNum: Int) -> Int {
        return sizes[stackNum] + (stackNum * stackCapacity) - 1
    }
}

class StackOverflowError : Error {
    
}

let fixedMultiStack = FixedMultiStack(stackSize: 5)
do {
    try fixedMultiStack.push(stackNum: 1, value: 2)
    try fixedMultiStack.push(stackNum: 1, value: 2)
    try fixedMultiStack.push(stackNum: 1, value: 2)
    try fixedMultiStack.push(stackNum: 1, value: 2)
    try fixedMultiStack.push(stackNum: 1, value: 2)
    //try fixedMultiStack.push(stackNum: 1, value: 2) // stack overflow error
    try fixedMultiStack.push(stackNum: 0, value: 2)
} catch {
    print ("stack overflow")
}
