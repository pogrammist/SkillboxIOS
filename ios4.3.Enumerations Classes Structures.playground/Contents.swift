import UIKit

//Модуль 4

//1) Прочитайте главы Enumerations и Classes and Structures в книге «The Swift Programming Language»

//2) Если бы в твоей программе была работа с игральными картами, как бы ты организовал их хранение? Приведи пример.
//Я буду использовать Множества, так как это неупорядоченные коллекции уникальных значений.
let cards: Set<String> = ["A♠", "2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "J♠", "Q♠", "К♠", "JOKER♠", "A♥", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "J♥", "Q♥", "К♥", "JOKER♥", "A♣", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "J♣", "Q♣", "К♣", "JOKER♣", "A♦", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "J♦", "Q♦", "К♦", "JOKER♦"]

//3) Каких типов могут быть raw значения кейсов enum’а?
//raw значения - исходные значения могут быть строками, символами или любым целым числом или числом с плавающей точкой. Каждое исходное значение должно быть уникальным при его объявлении.

//4) Напишите класс и структуру для хранения информации (положение, размер) о круге, прямоугольнике
struct CircleСoordinates {
    var x = 100
    var y = 100
}

class Circle {
    var coordinates = CircleСoordinates()
    var radius = 50
}

struct RectangleСoordinates {
    var x = 200
    var y = 100
}

class Rectangle {
    var coordinates = RectangleСoordinates()
    var width = 50
    var height = 20
}

//5) Для следующего кода, выполнение каких строчек закончится ошибкой и почему:
class ClassUser1{
    let name: String
    init(name: String) {
        self.name = name
    }
}

class ClassUser2{
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct StructUser1{
    let name: String
    init(name: String) {
        self.name = name
    }
}

struct StructUser2{
    var name: String
    init(name: String) {
        self.name = name
    }
}

let user1 = ClassUser1(name: "Nikita")
//user1.name = "Anton"
//    Вызовет ошибку: Невозможно присвоить свойству: 'name' является константой 'let'

let user2 = ClassUser2(name: "Nikita")
user2.name = "Anton"

let user3 = StructUser1(name: "Nikita")
//user3.name = "Anton"
//    Вызовет ошибку: Невозможно присвоить свойству: 'name' является константой 'let'

let user4 = StructUser2(name: "Nikita")
//user4.name = "Anton"
//    Вызовет ошибку: Невозможно присвоить свойству: 'user4' является константой 'let'

var user5 = ClassUser1(name: "Nikita")
//user5.name = "Anton"
//    Вызовет ошибку: Невозможно присвоить свойству: 'name' является константой 'let'

var user6 = ClassUser2(name: "Nikita")
user6.name = "Anton"

var user7 = StructUser1(name: "Nikita")
//user7.name = "Anton"
//    Вызовет ошибку: Невозможно присвоить свойству: 'name' является константой 'let'

var user8 = StructUser2(name: "Nikita")
user8.name = "Anton"

//6) Напишите пример класса автомобиля (какие поля ему нужны – на ваше усмотрение) с конструктором, в котором часть полей будет иметь значение по умолчанию
class Car {
    var model: String
    var color: UIColor? = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    init(model: String, color: UIColor?) {
        self.model = model
        self.color = color
    }
}

var car = Car(model: "mersedes", color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))

//7) Напишите класс для калькулятора с функциями для сложения, вычитания, умножения и деления цифр, которые в нем хранятся как свойства
class calculate {
    var x = 0.0
    var y = 0.0
    
    init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    var plus: Double { x + y }
    var multiply: Double { x * y }
    var divide: Double { x / y }
    var subtract: Double { x - y }
}
calculate(1,2).plus
calculate(3,4).multiply
calculate(5,6).divide
calculate(7,8).subtract

//8) В каких случаях следует использовать ключевое слово static?
//    Когда необходимо объявить свойство или метод относящийся к классу, а не его экземпляру

//9) Могут ли иметь наследников:
//1.Классы
//    Могут
//2.Структуры
//    Не могут
//3.Enum’ы
//    Не могут

//10) Представим, что вы создаете rpg игру. Напишите структуру для хранения координаты игрока, enum для направлений (восток, сервер, запад, юг) и функцию, которая берет к себе на вход позицию и направление и возвращает новую координату (после того как игрок походил на одну клетку в соответствующую сторону). Вызовите эту функцию несколько раз, «походив» своим игроком


struct Position{
    var x, y : Double
}

enum Direction {
    case right
    case left
    case up
    case down
}

class Gamer {
    var position = Position(x: 0.0, y: 0.0)
    
    init(position: Position) {
        self.position = position
    }
    func move(_ direction: Direction) {
        switch direction {
        case .right:
            self.position.x += 1
        case .left:
            self.position.x -= 1
        case .up:
            self.position.y += 1
        case .down:
            self.position.y -= 1
        }
    }
}

var gamer = Gamer(position: Position(x: 1, y: 1))
gamer.move(.up)
gamer.move(.right)
gamer.move(.up)
gamer.move(.right)
gamer.move(.down)
gamer.move(.left)
gamer.position.x
gamer.position.y

//Бонусные задания к урокам:
//Енамы
//Можно ли в enum’е хранить дополнительные данные?
//Перечисления в Swift - типы “первого класса”. Они обладают особенностями, которые обычно поддерживаются классами, например, вычисляемые свойства, для предоставления дополнительной информации о текущем значении перечисления, методы экземпляра для дополнительной функциональности, относящейся к значениям, которые предоставляет перечисление.

//Классы
//В каких случаях удобнее структурировать данные и функции в класс?
//Для создания единой связанной конструкции из свойст и методов.

//Структуры
//В каких случаях лучше использовать класс, а в каких – структуру?
//В случае необходимосьти наследовать функционал определенного класса, поэтому возможно использовать только классы. Наследоваться от структуры невозможно.
