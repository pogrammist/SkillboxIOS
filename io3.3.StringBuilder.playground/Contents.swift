import UIKit

let strings: [String] = ["один", "два", "три", "четыре", "пять"]
func stringBuilder(array: [String]) -> String{
        var bigString = ""
    let count = strings.count - 1
        for string in strings {
            if string != strings[count] {
                bigString += (string.description + ",")
        } else {
                bigString += string.description
        }
        }
    return (bigString)
}
stringBuilder(array: strings)
