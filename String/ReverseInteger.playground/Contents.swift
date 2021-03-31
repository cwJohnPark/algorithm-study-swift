
func reverse(_ x: Int) -> Int {
    var target = x
    var reversed: Int64 = 0
    
    while target != 0 {
        reversed += Int64(target % 10)
        reversed *= 10
        target /= 10
    }
    reversed /= 10
    
    return reversed > Int32.max || reversed < Int32.min ? 0 : Int(reversed)
}

reverse(-321) // -123
reverse(123) //321
reverse(2_147_483_647)  //0
reverse(-2_147_483_648) // 0
//print(Int32.max) // 2,147,483,647
// print(Int32.min) // -2147483648

