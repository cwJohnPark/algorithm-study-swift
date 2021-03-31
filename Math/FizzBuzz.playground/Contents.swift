/*
 n = 15,

 Return:
 [
     "1",
     "2",
     "Fizz",
     "4",
     "Buzz",
     "Fizz",
     "7",
     "8",
     "Fizz",
     "Buzz",
     "11",
     "Fizz",
     "13",
     "14",
     "FizzBuzz"
 ]
 */
func fizzBuzz(_ n: Int) -> [String] {
    var result = [String]()
    for i in 1...n {
        var element = ""
        if i % 15 == 0 {
            element = "FizzBuzz"
        } else if i % 3 == 0 {
            element = "Fizz"
        } else if i % 5 == 0 {
            element = "Buzz"
        } else {
            element = "\(i)"
        }
        
        result.append(element)
    }
    return result
}

print(fizzBuzz(15))
