fun main() {
    
    print("Enter the numeric grade (0-100): ")
    val grade = readLine()?.toIntOrNull()

    if (grade == null || grade !in 0..100) {
        println("Invalid input. Please enter a numeric grade between 0 and 100.")
        return
    }

    
    val letterGrade = when {
        grade >= 90 -> "A"
        grade >= 80 -> "B"
        grade >= 70 -> "C"
        grade >= 60 -> "D"
        else -> "F"
    }

 
    println("Letter grade: $letterGrade")
}
