import UIKit

func inc(a: Int) -> Int{
        return a + 3
}

func dec(a: Int) -> Int{
        return a - 5
}

func compute(a: Int) -> Int{
        return inc(a: a) + dec(a: a)
}

let result = compute(a: 5) - compute(a: 3)
