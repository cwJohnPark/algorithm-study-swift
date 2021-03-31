func generate(_ numRows: Int) -> [[Int]] {
    var result = [[1]]
    for i in 1..<numRows {
        var row = [1]
        let former = result[i-1]
        
        var j = 1
        while j < i {
            row.append(former[j-1] + former[j])
            j += 1
        }
        
        row.append(1)
        result.append(row)
    }
    return result
}

//print(generate(1)) // [[1]]
//print(generate(2)) // [[1], [1,1]]
//print(generate(3)) // [[1], [1,1], [1,2,1]]
print(generate(4)) // [[1], [1,1], [1,2,1], [1,3,3,1]]

