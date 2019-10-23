import UIKit

var digits: [Int] = [10, 3, 50, 7, 90, 0, 100]
func middleOfIntArray(array: [Int]) -> Int {
    var sum: Int = 0
        for item in array {
            sum += item
        }
    let middle = sum / array.count
    return (middle)
}
middleOfIntArray(array: digits)
