func countPrimes(_ n: Int) -> Int {
    guard n > 1 else { return 0 }
    if n == 2 { return 1 }
    var primes = Array(repeating: true, count: n)
    
    var i = 2
    while i * i < n {
        if primes[i] {
            var j = i * i
            while j < n {
                primes[j] = false
                j += i
            }
        }
        i += 1
    }
    print(primes)
    var total = 0
    for i in 2..<n {
        total += primes[i] ? 1 : 0
    }
    
    return total
}

print(countPrimes(-2)) //0
print(countPrimes(1)) //0
print(countPrimes(2)) //1
print(countPrimes(10)) //4
