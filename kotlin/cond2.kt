fun main() {
    
    var originalPrice: Double
    var discountPercentage: Double
    var finalPrice: Double

   
    print("Enter the original price: ")
    originalPrice = readLine()?.toDoubleOrNull() ?: run {
        println("Invalid input for original price.")
        return
    }

    print("Enter the discount percentage (as a decimal between 0 and 1): ")
    discountPercentage = readLine()?.toDoubleOrNull() ?: run {
        println("Invalid input for discount percentage.")
        return
    }

    
    val threshold = 0.5
    if (discountPercentage > threshold) {
        println("The discount percentage is too high. Setting it to $threshold.")
        discountPercentage = threshold
    }

  
    finalPrice = originalPrice * (1 - discountPercentage)

    
    println("Original Price: $$originalPrice")
    println("Discount Percentage: ${(discountPercentage * 100)}%")
    println("Final Price after Discount: $$finalPrice")
}
