import UIKit

func greet(name: String, age: Int = 25){
    print("Hello \(name): \(age)!")
}

greet(name: "Nikita", age: 26)
greet(name: "Anton")

func square(value: Int) -> Int{
    return value * value
}

square(value: 2)

//----
func greet(name: String, hasAlreadyGreeted: Bool){
    if hasAlreadyGreeted{
        print("Hello again \(name)!")
    }else{
        print("Hello \(name)!")
    }
}

greet(name: "Nikita", hasAlreadyGreeted: false)
greet(name: "Nikita", hasAlreadyGreeted: true)

//----
func findMinMax(forArray array: [Int]) -> (min: Int, max: Int){
    var minimumValue = array[0]
    var maximumValue = array[0]
    for v in array{
        if v < minimumValue { minimumValue = v }
        if v > maximumValue { maximumValue = v }
    }
    return (minimumValue, maximumValue)
}

findMinMax(forArray: [5, 6, 9, 0, 3])

//-----
func findMinMax2(_ array: Int...) -> (min: Int, max: Int){
    var minimumValue = array[0]
    var maximumValue = array[0]
    for v in array{
        if v < minimumValue { minimumValue = v }
        if v > maximumValue { maximumValue = v }
    }
    return (minimumValue, maximumValue)
}

func swap2(a: inout Int, b: inout Int){
    let c = a
    a = b
    b = c
}

var a = 7
var b = 8

swap2(a: &a, b: &b)

//-----
func findMinMax3(_ array: Int...) -> (min: Int, max: Int){
    func findMin() -> Int{
        var minimumValue = array[0]
        for v in array{
            if v < minimumValue { minimumValue = v }
        }
        return minimumValue
    }
    func findMax() -> Int{
        var maximumValue = array[0]
        for v in array{
            if v > maximumValue { maximumValue = v }
        }
        return maximumValue
    }
    return (findMin(), findMax())
}

//-----
var userName: String? = "Nikita"
userName = nil

userName = "Anton"

var ageString = "26"
var age: Int! = Int(ageString)
var greeting = ""

if age != nil && userName != nil{
    greeting = "hello \(userName!): \(age!)"
}

if let age = age,
    let userName = userName{
    greeting = "hello \(userName): \(age)"
}

print(age)

//-----
greeting = (age < 18) ? "Hello, young man/woman" : "Hello"
greeting = "Hello \(userName ?? "")"
