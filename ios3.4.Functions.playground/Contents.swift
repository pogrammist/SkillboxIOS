//Модуль 3
//
//1) Прочитайте главы Functions и Basics (начиная с Optionals) в книге «The Swift Programming Language»
//2) Можно ли в функции вызвать другую функцию? Если да, приведите пример
//    Да
//    func gre(person: String) {
//        func et() -> String{
//            return person
//        }
//        print("Hello, \(et())!")
//    }
//    gre(person: "Dave")
//
//3) Напишите функцию, которая получает на вход массив строк, а возвращает одну строку, содержащую все элементы полученного массива через запятую
//    let strings: [String] = ["один", "два", "три", "четыре", "пять"]
//    func stringBuilder(array: [String]) -> String{
//            var bigString = ""
//        let count = strings.count - 1
//            for string in strings {
//                if string != strings[count] {
//                    bigString += (string.description + ",")
//            } else {
//                    bigString += string.description
//            }
//            }
//        return (bigString)
//    }
//    stringBuilder(array: strings)
//
//4) Напишите функцию, которая получает на вход два Int’а и меняет их значения, и при этом увеличивает их вдвое
//    func upTwo(first: inout Int, second: inout Int)
//                             -> (first: Int, second: Int){
//        first *= 2
//        second *= 2
//        return (first, second)
//    }
//    var a = 10
//    var b = 20
//    print(upTwo(first: &a, second: &b))
//
//5) Напишите функцию, которая получает на вход два массива с типом Int и возвращает true, если сумма чисел в первом массиве больше суммы чисел во втором массиве; иначе возвращает false
//    func comparator(firstArray: [Int], secondArray: [Int]) ->  Bool {
//            var sum1 = 0
//        var sum2 = 0
//            var x: Bool
//            for item in firstArray {
//                sum1 += item
//            }
//        for item in secondArray {
//                sum2 += item
//        }
//            if sum1 > sum2 {
//                x = true
//        } else {
//                x = false
//        }
//            return (x)
//    }
//    let digits1: [Int] = [1, 3, 5, 7, 9]
//    let digits2: [Int] = [2, 4, 6, 8, 10]
//    comparator(firstArray: digits1, secondArray: digits2)
//
//6) Напишите функцию, которая получает на вход массив Int и возвращает этот же массив, но отсортированный по убыванию
//    var digits: [Int] = [10, 3, 50, 7, 90, 0, 100]
//    func sortArray(firstArray: inout [Int]) -> [Int] {
//            var count: Int
//            repeat {
//                count = 0
//            for item in 1...(firstArray.count - 1) {
//                    if firstArray[item - 1] < firstArray[item] {
//                        let x = firstArray[item - 1]
//                        firstArray[item - 1] = firstArray[item]
//                        firstArray[item] = x
//                    count += 1
//                    }
//                }
//        } while count != 0
//            return (firstArray)
//    }
//    sortArray(firstArray: &digits)
//
//
//7) Напишите функцию, которая получает на вход массив Int и возвращает среднее значение всех элементов
//    var digits: [Int] = [10, 3, 50, 7, 90, 0, 100]
//    func middleOfIntArray(array: [Int]) -> Int {
//            var sum: Int = 0
//                for item in array {
//                    sum += item
//            }
//            let middle = sum / array.count
//        return (middle)
//    }
//    middleOfIntArray(array: digits)
//
//
//8) Напишите функцию, которая пытается найти индекс строки в массиве: на вход получает массив и строку для поиска, возвращает опшионал индекс этой строки в массиве
//    let strings: [String] = ["один", "два", "три", "четыре", "пять"]
//    func stringFinder(array: [String], string: String) -> Int? {
//            var index :Int?
//        for item in 1...(array.count - 1) {
//            if array[item - 1] == string{
//                    index = item
//                    break
//            } else {
//                    index = nil
//                }
//        }
//            return(index)
//    }
//    stringFinder(array: strings, string: "сто")
//
//  Чему будет равен result?
//    var age = Int("25.") ?? 0
//
//    var result = age < 18 ? "Hello, young man/woman" : "Hello grown man/woman"
//    result += " \(age)»
//
//    result == "Hello, young man/woman 0"
//
//9) Чему будет равен result?
//    func inc(a: Int) -> Int{
//            return a + 3
//    }
//
//    func dec(a: Int) -> Int{
//            return a - 5
//    }
//
//    func compute(a: Int) -> Int{
//            return inc(a: a) + dec(a: a)
//    }
//
//    let result = compute(a: 5) - compute(a: 3)
//
//    result == 4
//
//
//Бонусные задания к урокам:
//Функции
//Можно ли в функции вернуть tuple? Можно ли внутри функции написать другую функцию?
//    Функция может возвращать кортежи
//    func getAHighScore() -> (name: String, score: Int) {
//        let theName = "Patricia"
//        let theScore = 3894
//        return (theName, theScore)
//    }
//
//    Внутри функции можно написать функцию.
//    func getAHighScore() -> (name: String, score: Int) {
//        func getName() -> String {
//                let theMyName = "Alena"
//                return (theMyName)
//        }
//            let theName = getName()
//        let theScore = 3894
//            return (theName, theScore)
//    }
//    getAHighScore()
//
//Опшиналы
//В каких случаях следует использовать восклицательный знак для опшиналов?
//    В том случае, когда необходимо развернуть значение из опционала, и мы уверены что значение не равно nil.
