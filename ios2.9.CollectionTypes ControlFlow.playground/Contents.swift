//Модуль 2
//
//1) Прочитайте главы Collection Types и Control Flow в книге «The Swift Programming Language»
//2) Напишите все возможные варианты кода, в которых по-разному создается Int массив
//var someInts = [Int]()
//var threeInts = Array(repeating: 100, count: 3)
//var sumArrays = someInts + threeInts
//var intList: [Int] = [100, 200]
//
//3) Напишите код, который:
//1.создаст массив из трех Int элементов
//var intThree: [Int] = [1, 2, 3]
//
//2.добавит в этот массив еще один элемент
//intThree.append(4)
//
//3.удалит первый элемент
//intThree.remove(at: 0)
//
//4.с помощью цикла найдет минимальное и максимальное число
//var max = intThree[0]
//var min = intThree[0]
//for x in intThree {
//    if x > max {
//        max = x
//    }
//    if x < min {
//        min = x
//    }
//}
//max    //4
//min    //2
//
//5.Выведет в консоль (функция print) разницу между найденным максимальным и минимальным числом
//var increment = max - min
//print(increment) //2
//
//4) Напишите все возможные варианты кода, в которых по-разному добавляются новые элементы в массив
//var soomeInts = [Int]()
//soomeInts.append(3)
//soomeInts += [2]
//soomeInts += [23,32]
//
//5) Что получится в результате выполнения следующей программы:
//var array = [7, 5, 2]
//array[1] = 9
//array[2] = array[1] + array[2]
//print(array[2])
//
//Результат 11
//
//6) Напишите код, который:
//1.Создаст массив с именами людей (строки)
//var someNames: [String] = ["Вася", "Костя", "Артур", "Ильдар"]
//
//2.Создаст переменную greeting (пустую строку)
//var someString: String
//
//3.В цикле для каждого четного (по порядку) имени добавит в строку greeting "Go left, \(name)"; для каждого нечетного – "Go right, \(name)"
//var someNames: [String] = ["Вася", "Костя", "Артур", "Ильдар"]
//var someString: String
//var i = 0
//while i < someNames.count {
//    if i % 2 == 0 {
//        print("Go left, \(someNames[i])")
//    }
//    if i % 2 == 1 {
//        print("Go right, \(someNames[i])")
//    }
//    i = i + 1
//}
//
//7)Опишите словами, в чем различие между массивом и сетом
//Массив может содержать неуникальные элементы, сет содержит только уникальные элементы.
//Массив сохраняет порядок элементов, сет не сохраняет порядок элементов.
//
//8)Для следующего кода, что будет результатом выполнения подпунктов:
//let myEmoji: Set = ["😂", "🎊", "🕺", "🚀"]
//let wifeEmoji: Set = ["🎸", "😂", "🎊", "🦋"]
//1.myEmoji.intersection(wifeEmoji)
//Неуникальные элементы из обоих массивов
//2.myEmoji.symmetricDifference(wifeEmoji)
//Уникальные элементы из обоих массивов
//3.myEmoji.union(wifeEmoji)
//Все уникальные элементы из обоих массивов
//4.myEmoji.subtracting(wifeEmoji)
//Уникальные элементы из первого массива
//
//9) Напишите по примеру для реального приложения, в которых вы бы использовали Set, Array и Dictionary
//Set – Ученики в классе,
//Array – Буфер нажатых клавиш,
//Dictionary – Расписание остановок общественного транспорта.
//
//10) Для следующего кода допишите цикл, который выведет в консоль результат возведения числа number в степень power:
//let number = 5
//let power = 3
//for item in 1...5 {
//    print(item * power)
//}
//
//11) Представьте, что у нас есть константа, в которой мы храним настроение пользователя (число от 0 до 10):
//let mood = 7
//1.Напишите код, который в зависимости от значения этой константы (промежутки [0, 3], [4, 7], [8,10]) выводит в консоль разные сообщения пользователю с помощью if
//    if [0,3].contains(mood) {
//        print("Плохо")
//    } else if [4,7].contains(mood) {
//        print("Нормально")
//    } else if [8,10].contains(mood) {
//        print("Отлично")
//    }
//
//2.аналогично, но вместо if используйте switch
//    switch mood {
//    case 0...3:
//            print("Плохо")
//    case 4...7:
//            print("Нормально")
//    case 8...10:
//            print("Отлично")
//    default:
//            print("не удалось распознать настроение")
//    }
//
//
//Бонусные задания к урокам:
//Коллекции
//Что выведется в консоль?
//var array = ["🏆", "😎", "🎰"]
//array[1] = "💃"
//array[2] = array[1] + array[2]
//print(array)
//
//[«Кубок», «Девушка», «Девушка+Автоамт»]
//
//Условия
//Что выведется в консоль?
//var array = ["🏆", "😎", "🎰"]
//if array.count == 3 && array[1] == "😎"{ print("Good emoji") }
//else { print("Bad emoji pack") }
//
//"Good emoji"
//
//Циклы
//Что выведется в консоль?
//var sum = 0
//var array = [1, 2, 5, 9, 10, 12, 17]
//for v in array{
//    if v % 2 == 0 { sum += v }
//}
//print(sum)
//
//24
//
//Оператор switch
//В каких случаях удобнее использовать switch, а в каких if?
//
//Switch примножестве условий, if при нескольких условиях
