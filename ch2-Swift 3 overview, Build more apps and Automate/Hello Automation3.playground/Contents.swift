//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Arrays

var empty_array = [Int]()

//arrays with a given size and initial values

var array_with_initial_values = [Int](repeating : 1, count: 3)
print(array_with_initial_values)

//array with some different values

var my_array_with_values = [10,20,30,40,50]
print(my_array_with_values)

//Accessing Arrays

print(my_array_with_values[0])

//Adding new item to array
empty_array.append(5)

empty_array += [10]

print(empty_array)

//Modifying array
my_array_with_values[0] = 100
print(my_array_with_values)

//Iterate over an array

for item in my_array_with_values{
    print("We got our item as \(item)")
}

//range operator

for index in 1...5
{
    print("This is test # \(index)")
}

for _ in 1...5
{
    print("This is test..")
}

//While loop

/*
 while condition
 {
 statements
 }
 */

var final_score = 15

while final_score > 10 {
    
    print("Final score with while loop is \(final_score)")
    final_score = final_score - 1
}

//Repeat while loop

final_score = 1

repeat{
    print("Final score with repeat while loop is \(final_score)")
}while final_score > 10

