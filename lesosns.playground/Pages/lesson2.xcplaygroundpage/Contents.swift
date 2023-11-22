//: [Previous](@previous)

import Foundation


// ======== ternarny

let number = 7

let result1 = number % 2 == 0 ? "Even" : "Odd"
let result2 = if number % 2 == 0 { "Even" } else { "Odd" }

print("The number is \(result1).")
print("The number is \(result2).")









// ======== switch

let day = "Tuesday"

switch day {
case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday":
    print("It's a weekday")
case "Saturday", "Sunday":
    print("It's the weekend!")
default:
    print("Invalid day.")
}

let something = 555555

let x: Bool = true

switch x {
case true:
    break
case false:
    break
}

switch something {
case 1...5, 6...10:
    print("1...10")
case 11...20:
    print("11...20")
case 30...40:
    break
case 50...60:
    fallthrough
case 60...70:
    print("60...70")
default:
    print("default")
}

let tuple = (true, false)

switch tuple {
case (true, true): print("1, 1")
case (false, false): print("0, 0")
default: print("default")
}

switch tuple {
case let (x, y) where x != y: print("не равно \(x)")
case let (x, y) where x == y: print("равно")
case (let x, _) where x == x: print("xxx")
default: print("qqq")
}




// ======== while

var sum = 0
var i = 111

while i <= 10 {
    sum += i
    i += 1
}

print("The sum of numbers from 1 to 10 is \(sum)")

// ======== repeat - while

var sum1 = 0
var i1 = 111

repeat {
    sum1 += i1
    i1 += 1
} while i1 <= 10

print("The sum1 of numbers from 1 to 10 is \(sum1)")

// ====== label


var rez = 0
loop1: for i in 1...10 {
    for j in 1...10 {
        if i == 5, j == 5 {
            rez = i + j
            break loop1
        }
    }
}
print("i + j = \(rez)")


//: [Next](@next)
