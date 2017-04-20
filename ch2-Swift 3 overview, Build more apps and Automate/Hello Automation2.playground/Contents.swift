//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Comparision Operators
//==,!=,>,<,>= and <=

//==

var num1 = 100
var num2 = 100
var num3 = 150

num1 == num2

var strA = "Automation"
var strB = "Automation"
var strC = "Test"

strA == strB

strA == strC

//>

num3 > num1

num2 > num3

//>=

num1 >= num2

//<

num1 < num3

//<=

num1 <= num2

//IF statements

if(strA == strB)
{
    print("Test passed, both strA and strB are equal")
    
}


if(strA != strC)
{
    print("Test passed, strA is not equal to strC")
}

if(num3 > num1)
{
    print("Test passed, num3 is greater than num1")
    
}

if(num1 >= num2)
{
    print("Test passed, num1 is greater than or equal to num2")
}

if(num1 < num3)
{
    print("Test passed, num1 is less than num3")
}

if(num1 <= num2)
{
    print("Test passed, num1 is less than or equal to num2")
}


if(strA != strC)
{
    print("Test Passed..")
}
else{
    print("Test Failed...")
}

if(num3 > num1)
{
    print("Test Passed..")
    
}
else{
    print("Test Failed..")
}


//LOGICAL Operators
//AND, OR and NOT

//&&

if((strA == strB) && (num1 == num2))
{
    print("Test Passed, Both the expressions are true")
}
else{
    print("Test Faied.. One or both expressions are false")
}

//||

if((strA == strC) || (num1 == num2))
{
    print("Test Passed, One of the expression is true")
}
else{
    print("Test Failed, None of the expressions are true")
}

//!
if(!(strA == strC))
{
    print("Test Passed..")
}
else
{
    print("Test Failed..")
}

//Ternary Conditional Operator
/*
 if(SOME CONDITION)
 {
 EXPRESSION A
 }
 else
 {
 EXPRESSION B
 }
 */

var orangesAreOrange = false

if(orangesAreOrange)
{
    print("Test Passed.. Condition met")
}
else{
    print("Test Failed.. Condition not met.")
}

