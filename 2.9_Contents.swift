import UIKit

var names: [String] = ["Nikita", "Anton"]

names = ["Andrey"]

names.append("Nikita")

names.insert("Anton", at: 1)

names.remove(at: 1)

names

var otherNames = ["Maria", "Lena"]

var allNames = names + otherNames

//----
names.isEmpty

names.count

names

let firstName = names[1]
names[1] = "Andrey"

names

//----
var spendings: [Int] = [100, 500, 1000, 5000]

var totalSpendings = 0

for el in spendings{
    totalSpendings += el
}

totalSpendings

//----
var formattedSpendings = ""

for  (index, el) in spendings.enumerated(){
    formattedSpendings += "Day \(index + 1): \(el)"
}

formattedSpendings

//----
var musics: Set = ["Pop", "Rap", "Rock"]

musics.insert("Hip hop")
musics.insert("Hip hop")

musics

var myFavoriteMusics: Set = ["Pop", "Rap", "Rock"]

var isEqual = musics == myFavoriteMusics

myFavoriteMusics.count

myFavoriteMusics.contains("Hip hop")

var formattedMusics = ""

for music in musics.sorted(){
    formattedSpendings += "I like \(music)"
}

formattedMusics

//----
var ages = ["Nikita": 26, "Anton": 22]

ages["Nikita"]
ages[""]

ages["Nikita"] = 27

ages

ages["Andrey"] = 20
ages["Andrey"] = nil

ages.isEmpty
ages.count

var formattedAges = ""

for (name, age) in ages{
    formattedAges += "\(name): \(age)"
}

formattedAges

//----
if ages.isEmpty{
    formattedAges = "No names"
}else{
    formattedAges = "Has ages: "
}

//----
var age = 26

var result = ""

if age < 18{
    result = "No alcohol"
}else if age < 21{
    result = "Light alcohol"
}else if age < 25{
    result = "fdhsjg"
}else{
    result = "All alcohol"
}

result

//----
if !ages.isEmpty && age == 18 {
    result = "No alcohol"
}

//----

var number = 2

for _ in 0..<22{
    number *= 2
}

number

//----
for i in 1..<11{
    if i % 2 == 1 { continue }
    if number > 1000 { break }
    number *= i
}

//----
while number < 1000 {
    number *= 2
}

//----
repeat{
    number *= 2
} while number < 1000

//----
switch age {
case 0..<18: result = "No"
case 18, 21: result = "Starting from this yaer"
case 19..<21: result = "Light"
default: result = "All"
}

let userName = "Nikita"
switch userName {
case "Nikita", "Anton": result = "Access granted"
default: result = "No access"
}

result
