import UIKit

var myVar = 42
myVar = 50

let constant = 42
print(constant)

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble:Double = 70

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "hamburger"
print(shoppingList)

var occupations = ["Malcomlm":"captain", "Kaylee" : "mechanic"]
occupations["James"] = "Public Relations"
print(occupations)


let emptyArray = [String]()
let emptyDictionary = [String:Float]()

shoppingList = []
occupations = [:]

var todd = [Int]()

var optionalString: String? = "hello"
print(optionalString ?? "nothing")

print(optionalString == nil)

var optionalName: String? = "Anh Le"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello \(name)"
}
print(optionalName!)
print(greeting)

let name = "Joe"
let name2:String? = nil
var name3:String? = "Joe"
var name4 = name3!
print("name3 is \(String(describing:name3)), name4 is \(name4)")

var optionalString2: String? = "Hello"
var opt2: String? = optionalString2

var opt3 = opt2!
print(opt3)

for i in 0...99{
    i*i
}
let color = UIColor.purple

class Shape{
    var numberOfSides = 0
    func description() -> String{
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 7
print(shape.description())
