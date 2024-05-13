fun main() {
    print("Enter the distance value: ")
    val distance = readLine()?.toDoubleOrNull()
    if (distance == null) {
        println("Invalid input for distance value")
        return
    }

    print("Enter the unit (km or mi): ")
    val unit = readLine()

    val convertedDistance = when (unit) {
        "km" -> distance * 0.621371 // Convert kilometers to miles
        "mi" -> distance / 0.621371 // Convert miles to kilometers
        else -> {
            println("Invalid unit")
            return
        }
    }

    println("Converted distance: $convertedDistance ${if (unit == "km") "mi" else "km"}")
}
