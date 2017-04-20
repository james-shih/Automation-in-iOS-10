//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//sample of standard function
/*
 func funcname(Parameters) -> returnType
 {
 ---Do Something //Your clode block
 return parameters
 }
 
 */

func addNumbers(num1 : Int, num2: Int) -> Int
{
    let sum = num1 + num2
    return sum
}

print(addNumbers(num1: 10, num2: 20))

func getMsg() -> String
{
    let msg = "Test Passed"
    return msg
}

print(getMsg())

func returnMultiples(input_array : [Int]) -> (max : Int, min : Int)
{
    var max = 0
    var min = 0
    
    if(input_array.count > 1)
    {
        if(input_array[0] > input_array[1])
        {
            max = input_array[0]
            min = input_array[1]
            
        }
        else
        {
            max = input_array[1]
            min = input_array[0]
        }
        
    }
    
    return (max, min)
}

let test_array : [Int] = [10,20]

print(returnMultiples(input_array: test_array))

func printMsg(msg : String)
{
    print(msg)
}

printMsg(msg: "This is test...")

func printName(_ name: String)
{
    print("Your Name is \(name)")
}

printName("Nemo")
