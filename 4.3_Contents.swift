import UIKit

enum Directions: String{
    case left = "lf"
    case up = "up"
    case right = "rt"
    case bottom = "bt"
}

var currentDirection = Directions.left

currentDirection = .up

enum Code{
    case qr(String)
    case ups(Int, Int, Int, Int)
    case barCode
}

var code = Code.qr("12354")
var code2 = Code.ups(0, 0, 0, 0)

switch code {
case .qr(let value): print("qr code: \(value)")
case .ups(let a, let b, let c, let d): print("ups code: \(a), \(b), \(c), \(d)")
case .barCode: print("barcode")
}

if case .qr(let value) = code{
    print("Code = \(value)")
}

//----
if currentDirection == .right{
    print("right")
}

currentDirection

Directions(rawValue: "1")

//----
class Render{
    init() {
        print("Render is created")
    }
}

class Human{
    var age = 0
    var name = ""
    
    static var numberOfHumans = 0
    static let greeting = "Hello, i am human"
    
    var formattedName: String{
        return "**\(name)**"
    }
    
    var checkedAge: Int{
        get { return age < 0 ? 0 : age }
        set {
            if newValue >= 0 { age = newValue }
        }
    }
    
    lazy var render = Render()
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        Human.numberOfHumans += 1
    }
    
    init(nameToBeatify: String, age: Int) {
        name = "***\(nameToBeatify)***"
        self.age = age
        Human.numberOfHumans += 1
    }
    
    init?(age: Int) {
        if age < 0 { return nil }
        self.age = age
        Human.numberOfHumans += 1
    }
    
    convenience init(name: String){
        self.init(name: name, age: 26)
    }
    
    deinit {
        print("Deinit: \(name)")
        Human.numberOfHumans -= 1
    }
    
    func birthday() -> String{
        age += 1
        return "Happy birthday \(age) \(name)"
    }
    
    static func greet() -> String{
        return "Hello, we are humans number of \(numberOfHumans)"
    }
}

func createPerson(){
    let nikita = Human(nameToBeatify: "Nikita", age: 26)
    print(nikita.name)
}

createPerson()

let nikita = Human(age: -26)
let nikita2 = Human(name: "Nikita")

nikita2.name
nikita2.age

nikita2.birthday()
nikita2.birthday()

nikita2.render

nikita2.formattedName

nikita2.age = -1
nikita2.checkedAge

Human.greeting

func test(){
    let nikita3 = Human(name: "Nikita")
    Human.greet()
}

test()

Human.greet()

//-----
class HumanClass{
    var name = ""
    
    init(name: String) {
        self.name = name
    }
    
    func changeName(){
        name = "*" + name
    }
}

struct HumanStruct{
    var name = ""
    var age = 0
    
//    init(name: String) {
//        self.name = name
//    }
    
    mutating func changeName(){
        name = "*" + name
    }
}

let nikita4 = HumanClass(name: "Nikita")
nikita4.name = "Nikita *"

var nikita5 = HumanStruct(name: "Nikita", age: 7)
nikita5.changeName()
nikita5.name = "Nikita***"

//-----
enum A{
    case a, b

    var description: String{
        return self == .a ? "this is a" : "this is b"
    }
    
    func test() -> String{
        return self == .a ? "this is a" : "this is b"
    }
}

A.b.description
