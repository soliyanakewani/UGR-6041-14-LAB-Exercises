fun main() {
    print("enter number1")
    var num1=  readLine()?.toDouble() ?: run {
//         println("Invalid input for the first number")
        return
    }

     print("enter number2")
    var num2=  readLine()?.toDouble() ?: run {
        println("Invalid input for the second number")
        return
    }

    
    print("choose an operation(+,-,*,/)")
    
    var operation= readLine()
    
    var result = when(operation) {
        "+" -> println("result: ${num1 + num2}")
        "-" -> println("result: ${num1 - num2}")
        "*" -> println("result: ${num1 * num2}")
        "/" ->{
            if (num2 != 0.0) {
                println("result: ${num1 / num2}")
            } else {
                println("Error: Division by zero")
            }
        }
        else -> println("invalid operation")
        
    }
       
 

    }
    