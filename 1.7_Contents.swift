import UIKit

let name = "Nikita"
var courseNumber = 1

var giantNumber: Int64 = 78124897892347

var pi = 3.14

var strangeNumber = pi + Double(courseNumber)

var hasLogin = false

//----
let secondName = "Arkhipov"
let fullName = name + " " + secondName

//----
let course = 1

let courseGreeting = "Welcome to \(course + 1) course!"

let httpError = (code: 404, name: "Not found")

let (code, httpName) = httpError

//let formattedError = "Error: \(httpError.name)"

//----
let numberOfAttempts = 3
var currentAttempt = 1

currentAttempt += 1

let description = "Вам осталось \(numberOfAttempts - currentAttempt) попытки"

let remaining = numberOfAttempts - currentAttempt

//----
currentAttempt *= 2
//currentAttempt = -currentAttempt

currentAttempt == 4
currentAttempt != 4

name != "Anton"

currentAttempt >= 4

//----
hasLogin = !hasLogin
hasLogin = currentAttempt != 4
var hasPassword = false

var canEnterApp = hasLogin && hasPassword
canEnterApp = hasLogin || hasPassword


