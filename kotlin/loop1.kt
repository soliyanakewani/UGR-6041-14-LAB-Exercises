fun main() {
 
    print("Enter a string: ")
    val inputString = readLine()

    if (inputString.isNullOrEmpty()) {
        println("Input string is empty.")
        return
    }

    var minChar = inputString[0]
    var maxChar = inputString[0]

    for (char in inputString) {
        if (char < minChar) {
            minChar = char
        }
        if (char > maxChar) {
            maxChar = char
        }
    }

    println("Minimum character: $minChar (ASCII value: ${minChar.toInt()})")
    println("Maximum character: $maxChar (ASCII value: ${maxChar.toInt()})")
}