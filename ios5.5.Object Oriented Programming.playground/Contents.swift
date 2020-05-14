import UIKit

//1. Прочитать статью про ООП.

//В чем различие между классом и объектом?
//Класс описывает сущность. Объект реалезация класса.

//2. Решить задачу разделения сущностей на классы (используя наследование, где нужно) и протоколы в следующих программах:

//в игре есть сундук с инвентарем. Инвентарь — это различные игровые объекты, например: растения, оружие, квестовые предметы — картинка;
class Box {
    var items: Array = [Item]()
    
    func add(item: Item) {
        items.append(item)
    }
    
    func remove(index: Int){
        items.remove(at: index)
    }
}

protocol Item {
    var name: String { get set }
    var price: Double { get set }
}

class Knife: Item {
    var name = "noname"
    var price = 0.0
    var damage = 100.0
    
    init(name: String, price: Double, damage: Double) {
        self.name = name
        self.price = price
        self.damage = damage
    }
}

class Shield: Item {
    var name = "noname"
    var price = 0.0
    var protection = 50.0
    
    init(name: String, price: Double, protection: Double) {
        self.name = name
        self.price = price
        self.protection = protection
    }
}

var box = Box()
box.add(item: Knife(name: "knife", price: 100, damage: 500))
box.add(item: Shield(name: "shield", price: 100, protection: 700))
for i in box.items {
    print(i.name)
}
box.remove(index: 0)
for i in box.items {
    print(i.name)
}

//в игре показывается карта с: игроками, монстрами (ими управляет компьютер), интерактивными предметами и неподвижными элементами (например, деревья, стены) — картинка;
struct Position{
    var x, y : Double
}

class Unit {
    var position = Position(x: 0.0, y: 0.0)
    
    init(position: Position) {
        self.position = position
    }
}

enum Direction {
    case right
    case left
    case up
    case down
}

class Movable: Unit{
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
var table = Unit(position: Position(x: 10, y: 10))

var man = Movable(position: Position(x: 1, y: 1))
man.move(.up)
man.move(.right)
man.move(.down)
man.move(.left)
man.position.x
man.position.y

//у приложения есть 3 модели машин, у каждой из которых есть 3 комплектации. Модели отличаются названием, картинкой. Комплектации — названием, ценой, цветом, объемом двигателя.
class Car {
    enum Model {
        case coupe, sedan, hatchback
    }
    enum Complectation {
        case first, normal, best
    }
    var model: Model
    var label: Character
    
    var complectation: Complectation?
    var price: Double?
    var color: UIColor?
    var volume: Double?
    
    init(model: Model, label: Character) {
        self.label = label
        self.model = model
    }
    init(model: Model, label: Character, complectation: Complectation, price: Double, color: UIColor, volume: Double) {
        self.model = model
        self.label = label
        self.complectation = complectation
        self.color = color
        self.volume = volume
    }
}

var coupe = Car(model: Car.Model.coupe, label: "A")
var sedan = Car(model: Car.Model.sedan,
                label: "C",
                complectation: Car.Complectation.best,
                price: 100,
                color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                volume: 2.0)

//В каких случаях лучше использовать наследование, а в каких — расширения (extension)?
//  Наследование при необходимости расширить функционал родительского класса, расширение в случае недоступности исходного кода расширяемого класса.

//3. Ответить, не используя xcode: что выведется в консоль в результате выполнения следующего кода (если код некорректен, написать, какая строчка и почему не скомпилируется):

protocol A{
    func a()
}

protocol B{
    func b()
}

extension B{
    func b(){
        print("extB")
    }
}

class C: A{
    func a() {
        print("A")
    }

    func c(){
        print("C")
    }
}

class D: C, B{
    func b() {
        print("B")
    }
    func d(){
        print("D")
    }
}

let v1: A = D()
      v1.a()

// Класс C не является наследником класса B, соответственно не может быть приведен к нему, и класс B не может иметь методов класса C, так не является ни родителм ни наследником
//let v2: B = C()
//      v2.c()

// Класс D является наследником класса C, соответственно может быть приведен к нему, а класс C не может иметь метода d класса D, потому что является его родителем
let v3: C = D()
//      v3.d()

let v4: D = D()
      v4.a()



//4. Выучить определения полиморфизма, инкапсуляции и наследования — наверняка об этом спросят на собеседовании! Если их суть не до конца понятна, нужно пересмотреть видео, перечитать статью или написать в Телеграм. Свободно ориентироваться в этих понятиях крайне важно!
