//: [Previous](@previous)

import Foundation


// Создайте псевдоним для `Int`.
typealias Alen = Int

// Создайте псевдоним для кортежа, представляющего координаты точки.
typealias Coordinates = (Int, Int)

let copyCoordinates = Coordinates(2, 3)
print(copyCoordinates.1)
let (x, y) = copyCoordinates

// Создайте кортеж для хранения информации о студенте (имя, возраст, средний балл).
typealias SomeUserData = (name: String, age: Int, grade: Float)
let userData1: SomeUserData = (name: "vasya", age: 12, grade: 3.14)
let userData2: SomeUserData = (name: "vasya", age: 12, grade: 3.14)

// Распакуйте кортеж в переменные.






























// Создайте псевдоним для `Int`.

typealias Coordinata = Int

// Создайте псевдоним для кортежа, представляющего координаты точки.

typealias Point = (Coordinata, Coordinata, Coordinata)

var zero = (x: 0, y: 0, z: 0)

zero.x
zero.y
zero.z

// =======================

// Создайте кортеж для хранения информации о студенте (имя, возраст, средний балл).

typealias Age = Int
typealias MiddleBall = Double
typealias FIO = String

typealias StudentInfo = (FIO, Age, MiddleBall, Int)

let student1: StudentInfo = ("vasya", 21, 4.5, 1)

print("student = \(student1.0)")
print("age = \(student1.1)")
print("balls = \(student1.2)")


// Распакуйте кортеж в переменные.

let (name, age, ball, _) = student1
print("student = \(name)")
print("age = \(age)")
print("balls = \(ball)")





//: [Next](@next)
