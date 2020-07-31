import UIKit

class Car{
    var color = ""
    var number = ""
    var name: String?
    var model = ""
    
    func accelerate(){
        print("\(model) is accelerating")
    }
    
    func stop(){
        print("\(model) is stoping")
    }
}

let myCar = Car()
myCar.model = "Mercedes"
myCar.color = "black"

let brothersCar = Car()
brothersCar.model = "Toyota"

myCar.accelerate()
brothersCar.accelerate()
myCar.stop()


//-----
class Human{
    
    private var thoughts = ""
    
    func greet(){
        thoughts = "I'm greeted"
        hug()
    }
    
    private func hug(){
        thoughts = "I'm hugged"
    }
    
    func askToSayThoughts() -> String{
        return thoughts
    }
}

let nikita = Human()
//nikita.thoughts = "Hello world"
nikita.askToSayThoughts()
nikita.greet()
nikita.askToSayThoughts()

//-----
class LivingThing{
    func born() -> String{
        return "I was born"
    }
    
    func die() -> String{
        return "I died"
    }
}

class Animal: LivingThing{
    func makeNoise() -> String{
        return "I'm making super noise"
    }
    
    func move() -> String{
        return "I'm moving"
    }
}

class Cat: Animal{
    func climbWall() -> String{
        return "I'm climbing the wall"
    }

    override func makeNoise() -> String {
        return super.makeNoise() + " Meow"
    }
}

class Dog: Animal{
    func threatenBurglar() -> String{
        return "I'm threating"
    }
    
    override func makeNoise() -> String {
        return "Wow-wow"
    }
}

let meow = Cat()
meow.born()
meow.climbWall()
meow.makeNoise()

let puppy = Dog()
puppy.threatenBurglar()
puppy.move()
puppy.makeNoise()


//-----
protocol Firable{
    func fire(at: String) -> String
}

protocol Moveable{
    func move()
}

class Human2: Moveable{
    fileprivate var age = 0

    func move() {
        print("I'm moving")
    }
}

class WarRobot: Moveable, Firable{
    func move() {
        print("I moved and killed everything in my way")
    }
    
    func fire(at: String) -> String {
        return "I fired ad \(at)"
    }
}

let robot = WarRobot()
robot.fire(at: "Enemy")

//-----
extension Human2{
    
    func jumpInThePool() -> String{
        age += 1
        return "I'm jumped in the pool"
    }
}

extension Int{
    func minusValue() -> Int { return -self }
}

7.minusValue()

let h = Human2()
h.age

//-----
protocol Drawable{
    func draw(in map: Map) -> String
}

struct Obstacle: Drawable{
    func draw(in map: Map) -> String {
        return "I'm obstacle"
    }
}

enum Birds: Drawable{
    case mockingbird, deliverybird
    
    func draw(in map: Map) -> String {
        return "Drawing \(self)"
    }
}

class Tree: Drawable{
    func draw(in map: Map) -> String {
        return "Tree is drawn"
    }
}

class Player: Drawable{
    func draw(in map: Map) -> String {
        return "Player is drawn"
    }
    
    func move(){}
}

class Enemy: Drawable{
    func draw(in map: Map) -> String {
        return "Enemy is drawn"
    }
    
    func fight(){}
}

class Map{
    func draw(objects: Drawable...) -> String{
        var result = ""
        for object in objects{
            result += object.draw(in: self) + "; "
        }
        return result
    }
}

let map = Map()
let tree = Tree()
let you = Player()
let enemy1 = Enemy()
let enemy2 = Enemy()
let obstacle = Obstacle()
let bird = Birds.mockingbird

map.draw(objects: tree, you, enemy1, enemy2, obstacle, bird)
