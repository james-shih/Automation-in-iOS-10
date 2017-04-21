//: Playground - noun: a place where people can play

import UIKit

class Rect {
    
    let side = 4
    
    private var length = 5
    private var width = 5
    
    func setLength(newLength: Int) {
        length = newLength
    }
    
    func getLength() -> Int {
        return length
    }
    
    func setWidth(newWidth: Int) {
        width = newWidth
    }
    
    func getWidth() -> Int{
        return width
    }
    
    func getArea() -> Int {
        return length * width
    }
}


let rect = Rect()
print(rect.side)

rect.setLength(newLength: 10)
print(rect.getLength())

rect.setWidth(newWidth: 10)
print(rect.getWidth())

print(rect.getArea())

class Paper: Rect {
    
    var color = ""
    
    func getColor() -> String {
        return color
    }
}

let paper = Paper()
paper.color = "Green"
print(paper.getColor())

paper.setLength(newLength: 8)
paper.setWidth(newWidth: 5)
print(paper.getArea())












