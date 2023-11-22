//: [Previous](@previous)

import Foundation

var greeting = "Hello, classes and structures"




// OPP - CLASSES

// cинтаксис объявления

class InspectorButton {
    var image = Image()
    var action: () -> Void = { }
    var color = .red
    var size = CGSize(width: 100, height: 100)
    func printing() { print("qqq")}
}

// экземпляры класса

//let redFich1 = Fish()
let fileInspector = InspectorButton.init()
let historyInspector: InspectorButton = .init()
let helpInspector = InspectorButton()






















// проперти (поля)

class SomeClass2 {
    var someInt: Int = 1
    let someString = "qqq"
}

let some2 = SomeClass2()


SomeClass2().someInt
print(some2.someInt)
print(some2.someString)


// доступ к свойствам

class SomeClass3 {
    var some2 = SomeClass2()
}

let some3 = SomeClass3()
var someInt = some3.some2.someInt

some3.some2.someInt = 11
print(some3.some2.someInt)
some3.some2.someInt = 22
print(some3.some2.someInt)




















// инициализаторы

enum Color {
    case dark
    case light
}

class Dog {
    var name: String
    var breed: String
    var color: Color = .light

    init(name1: String, breed1: String) {
        self.name = name1
        self.breed = breed1
    }

    init(light: Bool) {
        self.name = ""
        self.breed = ""
        self.color = light ? .light : .dark
    }

    init() {
        self.name = ""
        self.breed = ""
        self.color = .dark
    }
}

let myDog = Dog(name: "Fido", breed: "Labrador")




class Fish {
    var name: String
    var lenght: Double
    
    init(name: String, linght: Double) {
        self.name = name
        self.lenght = linght
    }
    init(name: String) {
        self.name = name
        self.lenght = 111
    }
    init(linght: Double) {
        self.name = "asdfgasdrfg"
        self.lenght = linght
    }
    init() {
        self.name = "q"
        self.lenght = 10
    }
}

var fishAkula = Fish(name: "akula", linght: 234.5)
var fishBarabulka = Fish(name: "barabulka", linght: 20.5)

fishAkula.name = "щука"
fishAkula.lenght = 11343
Fish()
var fishDefault = Fish()


















// методы

class Calculator {
    func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    
    func subtract(_ a: Int, _ b: Int) -> Int {
        a - b
    }
}

let myCalculator = Calculator()

let sum = myCalculator.add(5, 3)
let difference = myCalculator.subtract(10, 3)
















// вычисляемые свойства

class Circle {
    var radius: Double // свойство, проперти, поле
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area1() -> Double {
        print("fulfilled!!!")
        return 3.14159 * radius * radius
    }
    
    var area: Double {
        print("fulfilled!!!")
        return 3.14159 * radius * radius
    }
    
    var circumference: Double {
        2 * 3.14159 * radius
    }
}

let myCircle = Circle(radius: 5)

let area = myCircle.area

myCircle.area
myCircle.area1()

let circumference = myCircle.circumference





// ===================================================================== structs


// class - ссылочный тип
// struct - тип значение

// Int, Double, String, Array, Dictionary, Set - value types


struct Car {
    var brand: String
    var model: String
    var year: Int
    
    mutating func changBrand() {
        brand = "asdfasdf"
    }
}

var myCar = Car(brand: "toyota", model: "camry", year: 2020)
myCar.brand = "qwer"
print("car brand: \(myCar.brand)")


class Bike {
    var brand: String
    var model: String
    
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
    
    func changeBrand() {
        brand = "qwer"
    }
}

let myBike = Bike(brand: "gt", model: "hardtail")
myBike.brand = "qwer"


















// mutable

struct Counter {
    var count: Int
    
    mutating func increment() {
        count += 1
    }
    
    mutating func reset() {
        count = 0
    }
}

var myCounter = Counter(count: 0)
print("initial count: \(myCounter.count)")

myCounter.increment()
print("after increment: \(myCounter.count)")

myCounter.reset()
print("after reset: \(myCounter.count)")






// all of it works for classes and structures

// get and set

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            width * height
        }
        set {
            width = sqrt(newValue / height)
        }
    }
    
    func getArea() {
        width * height
    }
    
    mutating func setArea(_ x: Double) {
        width = sqrt(x / height)
    }
    
}

var myRectangle = Rectangle(width: 10, height: 5)

myRectangle.setArea(1)
myRectangle.area = 1.0

print("area: \(myRectangle.getArea())")
print("area: \(myRectangle.area)")










// willSet, didSet

//class
struct Circle {
    var radius: Double {
        willSet {
            print("about to set radius to \(newValue)")
        }
        didSet {
            print("radius was changed from \(oldValue) to \(radius)")
        }
    }
}

var myCircle = Circle(radius: 5)
myCircle.radius = 10












// static and class variables

struct Math1 {
    static let pi = 3.14159
    
    static func printPI() {
        print(Math1.pi)
    }
}

class Math2 {
    static let pi1 = 3.14159
    class var pi2: Double { 3.14159 }
    
    class func printPI1() {
        print(pi1)
    }
    static func printPI2() {
        print(pi2)
    }
    
}

var z = Math2.pi1

print(Math1.pi)
print(Math2.pi1)
print(Math2.pi2)
Math1.printPI()
Math2.printPI1()
Math2.printPI2()


struct Printer {
    static var data: Int = 0
    
    func print() {
        Swift.print(Printer.data)
    }
}

var x1 = Printer()
var x2 = Printer()

Printer.data = 1
x1.print()
Printer.data = 2
x2.print()

Printer.data = 3
print(Printer.data)




// deinit

class LightBulb {
    var isOn: Bool
    
    init() {
        isOn = false
        print("LightBulb created.")
    }
    
    func turnOn() {
        isOn = true
        print("Light is now on.")
    }
    
    func turnOff() {
        isOn = false
        print("Light is now off.")
    }
    
    deinit {
        print("LightBulb is being deallocated.")
    }
}

if true {
    let bulb = LightBulb()
    bulb.turnOn()
    bulb.turnOff()
}


// =================================================================















//: [Next](@next)
