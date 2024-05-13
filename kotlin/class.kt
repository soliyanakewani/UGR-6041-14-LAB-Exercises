class BankAccount(private val accountNumber: String, private var balance: Double) {

    fun deposit(amount: Double) {
        if (amount > 0) {
            balance += amount
            println("Deposited $amount. New balance: $balance")
        } else {
            println("Invalid amount for deposit.")
        }
    }

    fun withdraw(amount: Double) {
        if (amount > 0) {
            if (balance >= amount) {
                balance -= amount
                println("Withdrawn $amount. New balance: $balance")
            } else {
                println("Insufficient funds. Cannot withdraw $amount. Current balance: $balance")
            }
        } else {
            println("Invalid amount for withdrawal.")
        }
    }

    fun printBalance() {
        println("Current balance: $balance")
    }
}

fun main() {
    val account = BankAccount("123456789", 1000.0)

    account.deposit(500.0)
    account.withdraw(200.0)
    account.withdraw(1500.0) 
    account.deposit(-100.0) 
    account.printBalance()
}
