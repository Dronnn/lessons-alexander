//: [Previous](@previous)
import Foundation


// === имена ===

/*
 Выбор Имён в Программировании: Лучшие Практики
 
 1 Чёткость использования:
 
 1.1 Включите все необходимые слова, чтобы избежать двусмысленности для человека, читающего код:
 Плохо: load()
 Хорошо: loadUserData()
 
 1.2 Уберите лишние слова. Каждое слово в имени должно передавать ключевую информацию:
 Плохо: getUserDataFromDatabase()
 Хорошо: getUserData()
 
 1.3 Называйте переменные, параметры и связанные типы в соответствии с их ролями, а не их типами:
 Плохо: stringName, arrayUsers
 Хорошо: userName, activeUsers
 
 
 2 Достижение грамотного использования:
 Достижение грамотного использования:
 
 2.1 Имена методов и функций должны формировать грамотные фразы на английском языке:
 Плохо: carDownload()
 Хорошо: downloadCarDetails()
 
 Плохо: userAgeGet()
 Хорошо: getUserAge()
 
 2.2 Начинайте имена методов создания с "make":
 Плохо: newList()
 Хорошо: makeList()
 
 Плохо: initializationOfObject()
 Хорошо: makeObject()
 
 3 Именование функций и методов с учетом их побочных эффектов:
 Те, у которых нет побочных эффектов, должны читаться как существительные, например, x.distance(to: y).
 Те, у которых есть побочные эффекты, должны читаться как глаголы, например, print(x), x.sort().
 
 3.1 Без побочных эффектов (читаются как существительные):
 
 Плохо: calculateRectangle()
 Хорошо: rectangleArea()
 
 Плохо: getDurationBetweenDates()
 Хорошо: dateDifference()
 
 3.2 С побочными эффектами (читаются как глаголы):
 
 Плохо: userListUpdate()
 Хорошо: updateUserList()
 
 Плохо: databaseEntriesDeletion()
 Хорошо: deleteDatabaseEntries()
 
 4 Используйте терминологию правильно:
 4.1 Избегайте редких терминов, если более распространенное слово передает значение так же хорошо.
 
 Плохо: calculateCircumgyration()
 Хорошо: calculateRotation()
 
 Плохо: retrieveBibliopoleData()
 Хорошо: retrieveBooksellerData()
 
 4.2 Не используйте сокращения. Их следует легко находить при веб-поиске.
 
 Плохо: getUsrDt()
 Хорошо: getUserData()
 
 Плохо: updProdList()
 Хорошо: updateProductList()
 
 
 4.3 Соблюдайте прецедент. Не оптимизируйте термины для начинающих, жертвуя соответствием существующей культуре.
 
 Плохо (слишком упрощено для новичков): getThing()
 Хорошо (соответствует индустрии): getObjectInstance()
 
 Плохо (слишком упрощено для новичков): makeNewStuff()
 Хорошо (соответствует индустрии): initializeNewComponent()
 
 */




// === Точки с запятой ===



let name = "?"; print(name)

func funcName() {
    print("")
    return
    print("")
}










// === строгая типизация и вывод типов ===

var age: UInt8 = 42

let thousand: UInt16 = 1_000

let one: UInt8 = 1

let summ = thousand + UInt16(one)

let value = 3
let fraction = 0.14159
let pi = Double(value) + fraction

let integerPi = Int(pi)











// === Опциональные типы ===

let possibleNumber = "qq"
let convertedNumber = Int(possibleNumber)

var response1: Int = 404
var response2: Int? = 404

response1 = 111
response2 = nil

response1 = (response2 ?? 0)

let optionalString: String? = "An optional string"
let nonOptionalString: String = optionalString!


let x: User? = nil; struct User {
    var name: String = ""
}

if x != nil {
    x?.name
}

if let x {
    print(x)
} else {
    //
}

x?.name

x ?? User()

func f() {
    guard let x else { return }
    x.name
    
}
















// === Кортежи ===

let myErrorData1 = (code: 404, message: "Not Found")

print("The status code is \(myErrorData1.code)")
print("The status message is \(myErrorData1.message)")

let myErrorData2 = (404, "Not Found")

print("The status code is \(myErrorData2.0)")
print("The status message is \(myErrorData2.1)")


let (code, message) = myErrorData1
print("The status code is \(code)")
print("The status message is \(message)")

let (codeNumber, _) = myErrorData1
print("The status code is \(codeNumber)")


func x2() -> (Int, String) {
    (11, "")
}

struct YY {
    let x: Int
    let y: String
}

func x3() -> YY {
    YY(x: 11, y: "")
}














// === Псевдонимы типов ===

typealias Age = Int
typealias User1 = (Int, String, Float, Bool)
typealias IntClosure = (Int) -> Void

var data: User1 = (22, "qqq", 3.14, false)

struct Data {
    let data: User1
    let closure: IntClosure
}


//: [Next](@next)
