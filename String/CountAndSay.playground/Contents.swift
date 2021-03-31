func countAndSay(_ n: Int) -> String {
    var count = 1
    var say = "1"
    while count != n  {
        say = make(say)
    }

    return say
}

// 3322251 -> 3(2), 2(3), 5(1), 1(1) -> 23321511
func make(_ say: String) -> String {
    var tables =  [[String]]()
    // separate
    var strs = Array(say)

    var tmpArr = [Character]()
    for s in strs {
        if !tmpArr.isEmpty || s == tmpArr.last! {
            tmpArr.append(s)
        } else {
            tables.append(tmpArr)
        }
    }

    // translate

}


