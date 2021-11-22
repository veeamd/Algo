//
//  ExtraLongFactorial.swift
//  Algo
//
//  Created by Wei Zhang on 10/2/21.
//

import Foundation
// https://www.hackerrank.com/challenges/extra-long-factorials/problem
func extraLongFactorials(n: Int) -> String {
    var bigInt: [Int] = []
    bigInt.append(1)
    if n > 1 {
        for i in 2...n {
            var multiplier = i
            var multiplierArr: [Int] = []
            while multiplier > 0 {
                let digit = multiplier % 10
                multiplierArr.append(digit)
                multiplier = multiplier / 10
            }
            var newBigInt = Array(repeating: 0, count: bigInt.count)
            for (index, digit) in multiplierArr.enumerated() {
                var base = bigInt
                base.append(contentsOf: Array(repeating: 0, count: index))
                newBigInt = add(newBigInt, multiply(base, by: digit))
            }
            bigInt = newBigInt
            print("bigInt: \(bigInt)")
        }
    }
    var result = ""
    for i in bigInt {
        result.append("\(i)")
    }
    return result
}

func multiply(_ bigInt: [Int], by multiplier: Int) -> [Int] {
    var copy = bigInt
    for i in 0..<bigInt.count {
        copy[i] = copy[i] * multiplier
    }
    var i = copy.count - 1
    var c = 0
    while i >= 0 {
        let newValue = copy[i] + c
        copy[i] = newValue % 10
        c = newValue / 10
        i -= 1
    }
    if c > 0 {
        copy.insert(c, at: 0)
    }
    return copy
}

func add(_ bigInt: [Int], _ another: [Int]) -> [Int] {
    var i = bigInt.count - 1
    var j = another.count - 1
    var result = Array(repeating: 0, count: max(bigInt.count, another.count))
    var r = result.count - 1
    var c = 0
    while i >= 0 && j >= 0 {
        let newValue = bigInt[i] + another[j] + c
        result[r] = newValue % 10
        c = newValue / 10
        i -= 1
        j -= 1
        r -= 1
    }
    while i >= 0 {
        let newValue = bigInt[i] + c
        result[r] = newValue % 10
        c = newValue / 10
        i -= 1
        r -= 1
    }
    while j >= 0 {
        let newValue = another[j] + c
        result[r] = newValue % 10
        c = newValue / 10
        j -= 1
        r -= 1
    }
    if c > 0 {
        result.insert(c, at: 0)
    }
    return result
}
