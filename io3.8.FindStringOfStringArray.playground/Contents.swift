import UIKit

let strings: [String] = ["один", "два", "три", "четыре", "пять"]
func stringFinder(array: [String], string: String) -> Int? {
    var index :Int?
    for item in 1...(array.count - 1) {
        if array[item - 1] == string{
            index = item
            break
        } else {
            index = nil
        }
    }
    return(index)
}
stringFinder(array: strings, string: "сто")
