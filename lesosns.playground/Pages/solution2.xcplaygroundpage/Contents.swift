//: [Previous](@previous)

import Foundation

// Преобразуйте числовую оценку в буквенную (A, B, C, D, F).


// Найдите минимальное из двух чисел без использования `if`.
































// Преобразуйте числовую оценку в буквенную (A, B, C, D, F).

switch 1 {
case 1: print("F"); fallthrough
case 2: print("D"); fallthrough
case 3: print("C"); fallthrough
case 4: print("B"); fallthrough
case 5: print("A"); fallthrough
default:
    print("error")
}



// Найдите минимальное из двух чисел без использования `if`.

var x = 1
var y = 2

var result = x < y ? "\(x) - min" : "\(y) - min"
//: [Next](@next)
