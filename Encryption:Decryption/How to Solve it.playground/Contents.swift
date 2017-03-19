//: Playground - noun: a place where people can play

import UIKit

func stringLength(_ number : Int) -> Int {
    let numString = String(number)
    print(Array(numString.characters.reversed()))
    return numString.characters.count
}

let num = 12345

func reverse(number : Int) -> Int {
    var number = number
    var reverse = 0
    
    while number != 0 {
        let digit = number % 10
        reverse = reverse * 10 + digit
        number = number / 10
    }
    
    return reverse
}

reverse(number: num)

reverse(number: -987654321)

let number = 93

func decimalConversion(decimalNumber : Int, base : Int) -> Int {
    var quotient = decimalNumber
    var conversion = 0
    var quotientArray = [Int]()
    while quotient > 0 {
        let remainder = quotient % base
        quotientArray.append(remainder)
        quotient /= base
    }
    for i in quotientArray.reversed() {
        conversion = conversion * 10 + i
    }
    return conversion
}

decimalConversion(decimalNumber: 93, base: 8)

