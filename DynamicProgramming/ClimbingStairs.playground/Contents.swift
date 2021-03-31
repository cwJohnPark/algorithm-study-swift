
// 1. brute force
func climbStairs_bruteforce(_ n: Int) -> Int {
    return climbStairsHelper(0, n)
}

func climbStairsHelper(_ i: Int, _ n: Int) -> Int {
    if i > n {
        return 0
    }
    if i == n {
        return 1
    }
    
    return climbStairsHelper(i + 1, n) + climbStairsHelper(i + 2, n)
}

print(climbStairs_bruteforce(3)) // 3
print(climbStairs_bruteforce(5)) // 8

// 2. Recursion, Memoization
func climbStairs_memoization(_ n: Int) -> Int {
    var memo = Array.init(repeating: 0, count: n+1)
    return climbStairsMemoHelper(0, n, &memo)
}
func climbStairsMemoHelper(_ i: Int, _ n: Int, _ memo: inout [Int]) -> Int {
    if i > n {
        return 0
    }
    if i == n {
        return 1
    }
    if memo[i] > 0 {
        return memo[i]
    }
    
    memo[i] = climbStairsMemoHelper(i + 1, n, &memo) + climbStairsMemoHelper(i + 2, n, &memo)
    
    return memo[i]
}

print(climbStairs_memoization(3)) //3
print(climbStairs_memoization(5)) //8

// 3. Dynamic Programming
func climbStairs_dynamicprogramming(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var dp = Array.init(repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

print(climbStairs_dynamicprogramming(2)) //3
print(climbStairs_dynamicprogramming(3)) //3
print(climbStairs_dynamicprogramming(5)) //8
print(climbStairs_dynamicprogramming(6)) //13
