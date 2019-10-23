import UIKit

func comparator(firstArray: [Int], secondArray: [Int]) ->  Bool {
    var sum1 = 0
    var sum2 = 0
    var x: Bool
    for item in firstArray {
        sum1 += item
    }
    for item in secondArray {
        sum2 += item
    }
    if sum1 > sum2 {
        x = true
    } else {
        x = false
    }
    return (x)
}
let digits1: [Int] = [1, 3, 5, 7, 9]
let digits2: [Int] = [2, 4, 6, 8, 10]
comparator(firstArray: digits1, secondArray: digits2)
