//: [Previous](@previous)

import Foundation

// enum - перечисление
// enumeration - пренумерванный
// общий синтаксис



enum Direction1 {
    case north
    case south
    case east
    case west
}

enum Direction2 {
    case north, south, east, west
}

// как использовать

var direction1 = Direction1.west
var direction2: Direction2 = .west


direction1 = .south
direction1




// инструкция switch

switch direction1 {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
}

switch direction2 {
case .north, .south:
    print("north and south")
case .east:
    print("east")
default:
    print("default to west")
}
























// перебор всех вариантов

enum Days: CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thirsday
    case friday
    case satursay
    case sunday
}

var x: [Days] = [.wednesday]

for day in Days.allCases {
    print("important thing")
    if x.contains(day) {
        print("much more important thing")
    }
    print("important thing")
}











// ассоциативные значения

enum ErrorCode1: Int {
    case noData = 100
    case tooMuchData = 1000
}

enum ErrorCode2 {
    case noData(Int, String)
    case tooMuchData
}

let error: ErrorCode2 = .noData(404, "you have no data to handle!")

if case .noData(let code, let text) = error {
    if code == 404 {
        // show on the screen - code
        // turn on animatioin
        // sent request again
    } else if code = 401 {
        // handle reconnct
        
    }
   // show on the screen - text
}

enum Name {
    case caseName(Int)
}

var name: Name = .caseName(11)

print(name)


enum Tip {
    case big
    case small
}


enum Barcode {
    case upc(Int, Float, Int, String)
    case qrCode(String, Int)
    case qr3DCode(Float, Tip)
}

var productBarcode: Barcode = .upc(11, 22.0, 33, "text")

productBarcode = .qr3DCode(1.0, .big)



productBarcode = .qrCode("ABCDEFGHIJKLMNOP", 11)

switch productBarcode {
    
case let .upc(p1, p2, p3, p4):
    print("UPC: \(p1), \(p2)")
    
case let .qrCode(_, pp):
    print("QR code \(pp)")
    
case .qr3DCode(_, _):
    print("")
}










if 12 % 2 == 0, case .qrCode(_, let pp) = productBarcode, pp > 0 {
    print("QR code \(pp)")
}


























// исходные значения

enum Code: Int {
    case started = 101
    case inProgress = 202
    case finished = 303
}

enum ErrorCode: Int {
    case noData = 100
    case tooMuchData = 1000
    case ok = 200
}

var error = ErrorCode.noData

if error == .noData {
    
}

"empty"

if "emptу" == "empty" {
    print("yes")
} else {
    print("no")
}



Int
String



enum Gender: String {
    case male = "man"
    case female = "woman"
    case none = "empty"
}

let x: Gender? = .male

let gender = Gender.none



if case .none = gender {
    // handle
}




enum Tip1: String {
    case big = "qqq"
    case small = "werqwe"
}




















// инициализация через исходное значение

enum Code1: Int {
    case started = 101
    case inProgress = 202
    case finished = 303
}

var dataFromServer = 202

let variable1 = Code1(rawValue: dataFromServer)
let variable2 = Code1(rawValue: 101)

print(variable1!)
print(variable2 ?? .finished)

//let x: Int = Code1.finished.rawValue













// рекурсивные перечисления

indirect enum LinkedList {
    case node(Int, LinkedList)
    case end
    
}

func print(list: LinkedList) {
    switch list {
    case let .node(value, next):
        print("Value: \(value)")
        print(list: next)
    case .end:
        print("End of list.")
    }
}

var myList: LinkedList = .node(1, .node(2, .node(3, .end)))
print(list: myList)






//: [Next](@next)
