import UIKit
import SwiftUI
import Foundation

var greeting = "Hello, playground"

func swap<T> (_ a : inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
var a = 10
var b = 2
swap(&a, &b)

// MARK: -
struct box<T> {
    var item: T
}

let stringBox = box(item: "HEllo")
print(stringBox.item)

let intBox = box(item: 6)
print(intBox)

// MARK: -

func findMax<T: Comparable>(_ items: [T]) -> T? {
    guard var maxValue = items.first else {
        return nil
    }
    for item in items.dropFirst() {
        if item > maxValue {
            maxValue = item
        }
    }
    return maxValue
}
    
// MARK: - structures

struct goods {
    var name: String
    var price: Double
}

var q = goods(name: "apples", price: 2.5)

var e = q.name
print("\(q.name), \(q.price)")

// MARK: - Build a generic struct named Pair<Key, Value>

struct pair<key , value> {
    var key: key
    var value: value
    
    func describe() {
        // TODO: print key and valu like ali, nabi
        print("Key: \(key.self), Value: \(value.self)")
    }
}

let p = pair(key: "a", value: 10)
p.describe()
// MARK: - Create a Generic Stack<T>

struct stack<T> {
    var items: [T] = []
    mutating func push (_ element: T) {
        items.append(element)
    }
    mutating func pop() -> T? {
        return items.popLast()
    }
    func peek() -> T? {
        return items.last
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
}

var testStack = stack<Int>()
testStack.push(1)
testStack.push(2)
testStack.push(3)

print(testStack.peek() ?? 0)
print(testStack.pop() ?? 0)

// MARK: - function
func sayHi() {
    print("say hi")
}
sayHi()

func greet(name: String) {
    print("Hello, \(name)!")
}
greet(name: "ali")

func square(number: Int) -> Int {
    return number * number
}
square(number: 98)

func isEven(number: Int) -> Bool {
    guard number > 0 else {
        return false
    }
    return number % 2 == 0
    
}

isEven(number: 68)

func areaOfCircle(radius: Double) -> Double {
    return .pi * radius * radius
}

areaOfCircle(radius: 5.2)