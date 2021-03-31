func maxProfit(_ prices: [Int]) -> Int {
    var buyAt = 0
    var maxProfit = 0
    for i in 1..<prices.count {
        if prices[i] < prices[buyAt] {
            buyAt = i
        }
        maxProfit = max(prices[i] - prices[buyAt], maxProfit)
    }
    return maxProfit
}

print(maxProfit([7,1,5,3,6,4])) // 5
print(maxProfit([7,6,4,3,1])) // 0
print(maxProfit([1,2,3,4,5])) // 4



