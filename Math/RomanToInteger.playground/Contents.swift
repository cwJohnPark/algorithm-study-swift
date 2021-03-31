enum Roman: Int{
    case I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000

    static func parse(_ char: Character) -> Int {
        switch char {
        case "I" :
            return I.rawValue
        case "V" :
            return V.rawValue
        case "X" :
            return X.rawValue
        case "L" :
            return L.rawValue
        case "C" :
            return C.rawValue
        case "D" :
            return D.rawValue
        case "M" :
            return M.rawValue
        default : return 0
        }
        
    }
}

func romanToInt(_ s: String) -> Int {
    var total = 0
    let arr = Array(s)
    var i = 0
    
    while i < arr.count {
        if i+1 < arr.count && Roman.parse(arr[i]) < Roman.parse(arr[i+1]) {
            total += Roman.parse(arr[i+1]) - Roman.parse(arr[i])
            i = i+2
        } else {
            total += Roman.parse(arr[i])
            i = i+1
        }
    }
    
    return total
}

print(romanToInt("I")) //1
print(romanToInt("V")) //5
print(romanToInt("VI")) //6
print(romanToInt("IV")) //4
print(romanToInt("CMXCIV")) //994

