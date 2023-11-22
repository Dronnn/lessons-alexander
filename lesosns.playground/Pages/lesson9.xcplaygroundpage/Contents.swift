//: [Previous](@previous)

import UIKit

// **1. Any и AnyObject**

// когда вы не знаете конкретный тип данных или переменной, можно использовать `Any` или `AnyObject`. Они представляют собой обобщенные типы данных.

// **Any**:
// Any может представлять собой экземпляр любого типа, даже функциональных типов.

let int1 = 1
let double2 = 2.0
let string3 = "string"
let closure4: () -> Void = { print("closure4") }

let arr: [?] = [int1, double2]

let arr1: [Any] = [int1, double2, string3, closure4]

var arr2: [Any] = [
    5,
    "andreas",
    10.5,
    { text: String -> Int in return text.count }
]


// **AnyObject**:
// AnyObject` может представлять собой экземпляр любого класса. Обычно используется при работе с Objective-C API, так как в Objective-C нет строгой типизации, как в Swift.

class MyClass1 { }
class MyClass2 { }
var objects: [AnyObject] = [MyClass1(), MyClass2()]


func x(p: Any) {
    
    if p is Int {
        
    } else if p is String {
        
    } else if let pp = p as? Float {
         // pp
    }
}

x(p: 1)
x(p: "qwer")
x(p: MyClass1())




// **2. Guard**

func greet(person: [String: String]) {
    guard let name = person["man1"] else {
        print("Привет, незнакомец!")
        return
    }
    
    print("Привет, \(name)!")
}

greet(person: ["man1" : "vasya"])
greet(person: ["man2" : "petya"])

//
func processUserData(name: String?, age: Int?) {
    guard
        let userName = name,
        let userAge = age,
        userAge >= 18
    else {
        print("Недостаточно данных или возраст меньше 18 лет.")
        return
    }
    
    print("Привет, \(userName)! Тебе \(userAge) лет.")
}

processUserData(name: "vasya", age: 13)
processUserData(name: "vasya", age: nil)
processUserData(name: nil, age: 13)
processUserData(name: nil, age: nil)
processUserData(name: "petya", age: 21)

func describeItem(_ item: Any) {
    guard
        let stringItem = item as? String
    else {
        print("Элемент не является строкой.")
        return
    }
    
    print("Элемент является строкой: \(stringItem)")
}

describeItem(11)
describeItem("11")












// **3. Defer**


func deff() {
    print("1")
    defer {
        print("2")
        print("the end")
    }
    guard true else {
        return
    }
    return;
    
    print("3")
}


deff()





func loop() {
    for i in 1...5 {
        defer {
            print("Завершение итерации \(i)")
        }
        print("Итерация \(i)")
    }
}

loop()

func multiDeferExample() {
    print("Начало функции")
    
    defer {
        print("Первый defer")
    }
    
    defer {
        print("Второй defer")
    }
    
    print("Конец функции")
}

multiDeferExample()


func timeConsumingTask() {
    let startTime = Date()
    
    defer {
        let endTime = Date()
        let timeInterval = endTime.timeIntervalSince(startTime)
        print("Задача заняла \(timeInterval) секунд.")
    }
    
    // Какой-то длительный процесс
    for _ in 1...1_000_000 {
        _ = 1 + 1
    }
}

//timeConsumingTask()






// **4. Protocols**

protocol Vehicle {
    
    var numberOfWheels: Int { get }
    var fuelType: String { get }
    var isBrocken: Bool { get set }

    func description()
    func drive()
    func stop()
    
    func repair()
    
    func status()
}

class Car: Vehicle {
    var numberOfWheels: Int { 4 }
    var fuelType: String { "Бензин" }
    var isBrocken: Bool = false
    func drive() { print("Машина едет") }
    func stop() { print("Машина остановилась") }
    func repair()  { isBrocken = false }
    func description() {
        print("descr")
    }
}

class Bicycle: Vehicle {
    var numberOfWheels: Int { 2 }
    var fuelType: String { "Мускульная сила" }
    var isBrocken: Bool = false
    func drive() { print("Велосипед едет") }
    func stop() { print("Велосипед остановился") }
    func repair()  { isBrocken = false }
}

protocol Trailer {
    var hasTrailer: Bool { get set }
}

extension Trailer {
    var hasTrailer: Bool {
        get {
            false
        }
        set { }
    }
    func repair()  { }
}

protocol AutoTrain {
    var isTarin: bool { get set }
}

class Truck: Vehicle, Trailer {
    var numberOfWheels: Int { 6 }
    var fuelType: String { "Дизель" }
    var isBrocken: Bool = false
    func drive() { print("Грузовик едет") }
    func stop() { print("Грузовик остановился") }
    func repair()  { isBrocken = false }
}

extension Truck: AutoTrain {
    var isTarin: bool { true }
}

// Создание экземпляров
let myCar = Car()
let myBike = Bicycle()
let myTruck = Truck()

// Вызов методов
myCar.drive()
myCar.stop()

myBike.drive()
myTruck.stop()

// Получение свойств
print("Мой автомобиль использует \(myCar.fuelType)")
print("Мой велосипед имеет \(myBike.numberOfWheels) колеса")


// Работа с массивом объектов протокола
var vehicles: [Vehicle] = [myCar, myBike, myTruck]
var vehiclesTemp: [Vehicle] = []
for vehicle in vehicles {
    var mutableVehicle = vehicle
    if vehicle.isBrocken {
        if vehicle is Trailer {
            //
        }
        mutableVehicle.repair()
        vehiclesTemp.append(mutableVehicle)
    }
}
vehicles = vehiclesTemp


// **4. Extensions **


extension Vehicle {
    func status() {
        print("Транспортное стердство сломано: \(isBrocken)")
    }
}

extension Vehicle {
    func description() {}
}



extension Bicycle {
    func status() {
        print("Никогда не ломается")
    }
}


myCar.status()
myBike.status()
myTruck.status()

final class MainViewController: UIviewController {
    var textField: UITextField!

    var tableView: UItableView {
        fatalError()
    }

    func buttonPressed() {
        do {
            let isOk = try passwordValidation(textField.text)
            guard isOk else { return }
            dismiss()
        } catch {
            switch error as PassowrdError {
            case .isEmpty:
                present(vc, animated: true)
            default: break
            }
        }
    }

    func passwordValidation(_ pass: String) throws -> Bool {

        if pass.isEmpty {
            throw PassowrdError.isEmpty
        }

        if pass.count > 100 {
            throw PassowrdError.tooLong(data: pass.count)
        }

    }
}

extension MainViewController: UITableViewDelegate {

}

extension MainViewController: UITableViewDataSource {

}

extension Array {
    func backwardSrot() {
        //
    }
}

[1,2,3].backwardSrot()


// **5. Error Handling**

//protocol Error: Sendable { }

enum DataError: Error {
    case invalidData
    case dataNotFound
    case parsingError
}

enum PassowrdError: Error {
    case noCapitalLetters
    case noDigits
    case yesSpecialSymbols
    case isEmpty
    case tooShort
    case tooLong(data: Int)
}





func fetchData() throws -> Data {
    // do
    // do
    // do
    // do
    // do
    // do
    // do
    let data: Data? = nil
    if data == nil {
        throw DataError.dataNotFound
    }
    // do
    // do
    // do
    // do
    // do
    // do
    return Data()
}

do {
    try fetchData()
} catch {
    print("\(error)")
}

do {
    let data = try fetchData()
    // Продолжите обработку данных
    // Продолжите обработку данных
    // Продолжите обработку данных
    // Продолжите обработку данных
} catch DataError.dataNotFound {
    print("Данные не найдены.")
} catch DataError.parsingError {
    print("Ошибка при разборе данных.")
} catch {
    print("Произошла неизвестная ошибка: \(error).")
}

let data: Data? = try? fetchData()

//if let data = data {
if let data = try? fetchData() {
    // У вас есть данные
} else {
    // Ошибка произошла
}








//: [Next](@next)
