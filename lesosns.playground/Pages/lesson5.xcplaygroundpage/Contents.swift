//: [Previous](@previous)

import Foundation

var greeting = "Hello, optionals"

// ========================================================

// разберёмся с опшиналами

// ### 1. Что такое `nil`?
// `nil` представляет отсутствующее значение. Оно используется в Swift, чтобы указать, что у опциональной переменной нет значения.

// ### 2. Как создать переменную опционального типа?

var name: String? = nil

// `String?` - это опциональная версия `String`. Значение по умолчанию такой переменной - `nil`.

// ### 3. Что такое восклицательный знак `!`?
// Если вы уверены, что опциональное значение не `nil`, вы можете использовать `!`, чтобы извлечь его значение. Это называется "forced unwrapping".

let name1: String? = "andreas"
let unwrappedName1: String = name1! // force unwrap


// ### 4. Что такое два вопросительных знака `??`?
// Оператор `??` позволяет предоставить значение по умолчанию для опционала.

var name2: String? = nil
let unwrappedName2: String = name2 ?? "Default"


// ### 5. С помощью `if`

name1 // optional
if let name = name1 {
    print(name) // NON optional
    print(name1 ?? "") // optional
}
name1 // optional

// ### 6. С помощью `guard`
name2 = "q" // 1
guard let nameNew = name2 else { fatalError() } // 2
print(nameNew) // non op
print(name2!) // op
name2


// ### 8. Через `enums`
// Опшиналы реализованы как перечисления:

enum Optional<Value> {
    case none
    case some(Value)
}

var x1: Int? = 1
var x2: Optional<Int> = .some(1)

// ### 9. Связь с `try?` и `try!`
// `try?` возвращает опциональное значение, а `try!` форсирует извлечение результата и вызовет аварийное завершение, если произойдет ошибка.

//  let x1 = try? someFunction()
//  let x2 = try! someFunction()

// ### 10. Опциональная последовательность (`optional chaining`)
// Позволяет выполнять запросы к свойствам, методам и индексам опциональных значений.

let length = name?.count

class Address {
    var streetName: String?
}

let address: Address? = Address()
let streetNameLength = address?.streetName?.count


//: [Next](@next)
