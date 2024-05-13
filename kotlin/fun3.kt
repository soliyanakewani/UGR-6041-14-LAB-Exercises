fun transformToUppercase(strings: List<String>): List<String> {
    return strings.map { it.toUpperCase() }
}

fun filterNumbersGreaterThan(numbers: List<Int>, threshold: Int): List<Int> {
    return numbers.filter { it > threshold }
}

fun calculateSum(numbers: List<Int>): Int {
    return numbers.reduce { acc, num -> acc + num }
}

fun main() {
    val strings = listOf("apple", "banana", "orange")
    val uppercaseStrings = transformToUppercase(strings)
    println("Uppercase Strings: $uppercaseStrings")

    val numbers = listOf(10, 20, 30, 40, 50)
    val filteredNumbers = filterNumbersGreaterThan(numbers, 25)
    println("Numbers greater than 25: $filteredNumbers")

    val sum = calculateSum(numbers)
    println("Sum of numbers: $sum")
}
