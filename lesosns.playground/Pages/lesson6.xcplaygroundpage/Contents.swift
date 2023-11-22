//: [Previous](@previous)

import Foundation

// ================= множества

// создание

var floats = Set<Float>()
var floats2: Set<Float> = []

var strings: Set<String> = ["qqq", "www", "eee", "qqq", "www", "eee", "qqq", "www", "eee", "qqq", "www", "eee", "qqq", "www", "eee"]

print("Set<Float> с \(floats.count) элементами.")

// доступ

floats.insert(1.0)
floats2.insert(1.0)
floats = []


print(strings)

strings.remove("www")

if let removedString = strings.remove("qqq") {
    print("\(removedString)")
} else {
    print("нет такого элемента")
}

print(strings)

if strings.contains("eee") {
    print("есть")
} else {
    print("нет")
}
print(strings)

// перебор всех элементов

let defaults4: [Float] = Array(repeating: 0.0, count: 10)
var numbers: Set<Float> = Set(defaults4)

for number in numbers.sorted() {
    print("\(number)")
}

// операции

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let otherNumbers: Set = [2, 3, 5, 7]

let oddDigitsIntersection: Set = [1, 3, 111]

oddDigits.union(evenDigits).sorted()

oddDigits.intersection(evenDigits).sorted()
oddDigits.intersection(oddDigitsIntersection).sorted()
evenDigits.intersection(otherNumbers).sorted()

oddDigits.subtracting(otherNumbers).sorted()

oddDigits.symmetricDifference(otherNumbers).sorted()

let bigSet: Set = [1, 3, 5]
let smallSet: Set = [1, 3]

let isSubset = smallSet.isSubset(of: bigSet)
let isSuperset = oddDigits.isSuperset(of: smallSet)
let isDisjoint = bigSet.isDisjoint(with: evenDigits)





//: [Next](@next)
