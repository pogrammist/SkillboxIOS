import UIKit

var digits: [Int] = [10, 3, 50, 7, 90, 0, 100]
func sortArray(firstArray: inout [Int]) -> [Int] {
    var count: Int
    repeat {
        count = 0
        for item in 1...(firstArray.count - 1) {
            if firstArray[item - 1] < firstArray[item] {
                let x = firstArray[item - 1]
                firstArray[item - 1] = firstArray[item]
                firstArray[item] = x
                count += 1
            }
        }
    } while count != 0
    return (firstArray)
}
sortArray(firstArray: &digits)
