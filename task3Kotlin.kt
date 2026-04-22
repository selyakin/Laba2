import kotlin.math.sqrt

fun primeNumbers(N: Int, numbers: List<Int>): String {
    if (N <= 0) {
        return "Error: некорректный N"
    }
    
    for (el in numbers) {
        if (el <= 0) {
            return "Error: некорректное число (только натуральные числа)"
        }
    }
    
    var result = ""
    
    for (el in numbers) {
        if (result != "") {
            result += " "
        }
        
        var isPrime = true
        
        if (el == 1) {
            isPrime = false
        } else {
            val f = sqrt(el.toDouble()).toInt()
            var x = 2
            while (x <= f && isPrime) {
                if (el % x == 0) {
                    isPrime = false
                }
                x++
            }
        }
        
        result += if (isPrime) "Yes" else "No"
    }
    
    return result
}

fun main() {
    print("Введите количество чисел N: ")
    val N = readLine()!!.toInt()
    
    print("Введите $N чисел: ")
    val input = readLine()!!
    val numbers = input.trim().split(Regex("\\s+")).map { it.toInt() }
    
    println(primeNumbers(N, numbers))
}
