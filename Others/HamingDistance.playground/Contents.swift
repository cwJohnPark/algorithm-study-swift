func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var xor = x ^ y
    var count = 0
    while xor != 0 {
        if xor & 1 == 1 {
            count += 1
        }
        xor = xor >> 1
    }
    return count
}

print(hammingDistance(1, 4)) // 2
print(hammingDistance(4, 8)) // 2
