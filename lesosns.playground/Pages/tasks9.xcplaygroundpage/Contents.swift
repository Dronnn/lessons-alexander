//: [Previous](@previous)

import Foundation

/*
 
 **1. Guard**
 
 1.1. Создайте функцию, которая принимает опциональную строку. Используйте `guard` для проверки, что строка не nil и длина строки больше 5 символов. Если условия не выполняются, вывидите сообщение об ошибке.
 
 1.2. Напишите функцию, которая принимает возраст как Int и использует `guard` для проверки, что возраст больше или равен 18. Если это не так, верните соответствующее сообщение.
 
 1.3. Создайте функцию, которая принимает массив чисел. Используйте `guard` для проверки, что массив не пуст, а первый и последний элементы массива больше 10. Если одно из условий не выполняется, вывидите сообщение об ошибке.
 
 **2. Defer**
 
 2.1. Напишите функцию, которая выводит числа от 1 до 10. Используйте defer, чтобы после завершения цикла выводилось сообщение "Цикл завершен".
 
 1.2. Создайте функцию, которая принимает строку и пытается преобразовать её в целое число (Int). Используйте defer, чтобы выводилось сообщение "Преобразование завершено", независимо от результата.
 
 2.3. Создайте функцию с несколькими выходами (return). Используйте `defer` для вывода сообщения каждый раз, когда функция завершается, независимо от точки выхода.
 
 **3. Protocols**
 
 3.1. Определите протокол `Flying`, который требует метод `fly()`. Создайте два класса: `Bird` и `Airplane`, которые реализуют этот протокол.
 
 3.2. Создайте протокол `Charging`, который содержит свойство `batteryLevel` и метод `charge()`. Реализуйте этот протокол в классе `Phone`.
 
 3.3. Определите протоколы `Drawable` и `Erasable`. `Drawable` должен иметь метод `draw()`, а `Erasable` метод `erase()`. Создайте класс `Pencil`, который реализует оба протокола.
 
 ** 4. Any и AnyObject**
 
 4.1 Создайте массив с разными типами данных (Int, String, Double, etc.) используя Any. Затем пройдитесь по массиву и распечатайте только строки.
 
 4.2 Хранилище с AnyObject: Создайте два различных класса и по три экземпляра для кадого из классов (всего шесть экземпляров). передайте массив со всеми шестью объектами в функцию. Далее пройдитесь по массиву и распечатайте только экземпляры одного типи.
 
 4.3 Сравнение Any и AnyObject: Создайте функцию, которая принимает параметр типа Any, и функцию, которая принимает параметр типа AnyObject. Попробуйте передать в эти функции разные типы данных и объекты, затем сделайте выводы о различиях между Any и AnyObject.

 
 */



//: [Next](@next)
