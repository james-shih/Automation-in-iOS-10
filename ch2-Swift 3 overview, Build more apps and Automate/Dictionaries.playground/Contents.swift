//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Dictionaries

var mixtypesDict : [Int: String] = [1 : "Apples", 2 : "Grapes", 3 : "Cherries"]
print(mixtypesDict)

var strDict : [String:String] = ["Apples" : "Red", "Oranges" : "Orange", "Berries" : "Blue"]
print(strDict)

//access or retieve value from key
var valueForBerries = strDict["Berries"]!
print("Value for key Berries is \(valueForBerries)")

//update values
strDict.updateValue("Red", forKey: "Berries")
print(strDict)


strDict["Apples"] = "Green"
print(strDict)


strDict.removeValue(forKey: "Oranges")
print(strDict)

//Iterating over

for (key,value) in strDict
{
    print("We got key \(key) with value as \(value)")
}

//length of a dictionary

var numOfItemsinDict = strDict.count
print("There are \(numOfItemsinDict) items in our dictionary")


print(strDict.isEmpty)

