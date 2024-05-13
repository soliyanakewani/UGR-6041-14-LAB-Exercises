import kotlin.random.Random

fun generateRandomPassword(length: Int): String {
    val allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+"
    val password = StringBuilder()

    repeat(length) {
        val randomIndex = Random.nextInt(0, allowedChars.length)
        password.append(allowedChars[randomIndex])
    }

    return password.toString()
}

fun main() {
    print("Enter the length of the password: ")
    val length = readLine()?.toIntOrNull() ?: 8

    val password = generateRandomPassword(length)

   
    println("Generated Password: $password")
}
