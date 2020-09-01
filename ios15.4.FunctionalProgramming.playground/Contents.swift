import UIKit

// Отсортируйте массив чисел по возрастанию используя функцию sorted
var sortedArray = [2, 4, 5, 1321, -327, 0, 1].sorted()

// Переведите массив числе в массив строк с помощью функции map
var stringArray = [2, 4, 5, 1321, -327, 0, 1].map{ "\($0)" }

// Переведите массив строк с именами людей в одну строку, содержащую все эти имена, с помощью функции reduce
stringArray = ["lorem", "ipsum", "dolor", "sit", "amet"]
let string = stringArray.reduce("", { "\($0) \($1)" })

// Напишите функцию, которая принимает в себя функцию c типом (Void) -> Void, которая будет вызвана с задержкой в 2 секунды
func delayFunc(delay: Double = 2.0, function: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
        function()
    })
}

// Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции
func sumFunc(_ firstFunc: @escaping () -> Void, _ secondFunc: @escaping (Bool) -> Void) -> ((Bool) -> Void) {
    return { bool in
        firstFunc()
        secondFunc(bool)
    }
}

// Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берет на вход два числа и возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму
func sortArray(array: [Int], sortFunc: @escaping (Int, Int) -> Bool) -> [Int] {
    var sortingArray = array
    for i in 0..<(sortingArray.count - 1) {
        for j in i + 1..<sortingArray.count {
            if sortFunc(sortingArray[i], sortingArray[j]) {
                let buffer = sortingArray[i]
                sortingArray[i] = sortingArray[j]
                sortingArray[j] = buffer
            }
        }
    }
    return sortingArray
}

let array = [2, 4, 5, 1321, -327, 0, 1]
let sortingArray = sortArray(array: array, sortFunc: { $0 > $1 })
sortingArray

// Напишите своими словами что такое infix, suffix, prefix операторы
// infix - между двумя переменными
// prefix - перед переменной
// suffix - после переменной
// Операторы можно переопределять для работы с разными типами данных

