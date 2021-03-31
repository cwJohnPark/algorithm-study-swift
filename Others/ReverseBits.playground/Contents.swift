func reverseBits(_ n: Int) -> Int {
    var result = 0
    var num = n
    for i in 0..<32 {
        result |= (num & 1) << (31 - i)
        num = num >> 1
    }
    
    return result
}

print(String(reverseBits(1), radix: 2)) // 10000000000000000000000000000000
print(String(reverseBits(2), radix: 2)) // 1000000000000000000000000000000
print(String(reverseBits(Int(UInt32.max)), radix: 2)) // 11111111111111111111111111111111
