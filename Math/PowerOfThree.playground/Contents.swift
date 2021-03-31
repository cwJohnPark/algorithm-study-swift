func isPowerOfThree(_ n: Int) -> Bool {
    if n == 1 { return true }
    return isPowerOfThreeHelper(n, 3)
}
func isPowerOfThreeHelper(_ n: Int, _ power: Int) -> Bool {
    if n == power { return true }
    if n < power { return false }
    return isPowerOfThreeHelper(n, power * 3)
}
print(isPowerOfThree(1)) // true
print(isPowerOfThree(27)) // true
print(isPowerOfThree(0)) // false
print(isPowerOfThree(9)) // true
print(isPowerOfThree(45)) // false
print(isPowerOfThree(-45)) // false
print(isPowerOfThree(-27)) // false


