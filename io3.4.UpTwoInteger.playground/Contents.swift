import UIKit

func upTwo(first: inout Int, second: inout Int)
                         -> (first: Int, second: Int){
    first *= 2
    second *= 2
    return (first, second)
}
var a = 10
var b = 20
print(upTwo(first: &a, second: &b))
