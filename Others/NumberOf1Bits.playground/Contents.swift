func hammingWeight(_ n: Int) -> Int {
    var num = n
    var total = 0
    for _ in 0..<32 {
        if num & 1 == 1 {
            total += 1
        }
        num = num >> 1
    }
    return total
}

print(hammingWeight(3)) // 2
print(hammingWeight(256)) // 1
print(hammingWeight(-3)) // 31




