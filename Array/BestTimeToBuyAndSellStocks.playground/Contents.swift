func maxProfit(_ prices: [Int]) -> Int {
    var profits = [0]
    
    for i in 1..<prices.count {
        let profit = prices[i] - prices[i-1]
        if profit > 0 {
            profits.append(profits[i-1] + profit)
        } else {
            profits.append(profits[i-1])
        }
    }
    return profits[profits.count-1]
}

print(maxProfit([7,1,5,3,6,4])) // 7
print(maxProfit([1,2,0,3,4,0,5])) // 10
print(maxProfit([1,2,3,4,5])) // 4
print(maxProfit([7,6,4,3,1])) // 0


