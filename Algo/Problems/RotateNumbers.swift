//
//  RotateNumbers.swift
//  Algo
//
//  Created by Wei Zhang on 4/8/22.
//

import Foundation

class RotateNumbers {
    func rotatedDigits(_ n: Int) -> Int {
        var count = 0
        for i in 1..<(n+1) {
            count += isNumberRotatesValidly(i) ? 1 : 0
        }
        return count
    }

    func isNumberRotatesValidly(_ n: Int) -> Bool {
        var n = n
        var numberOfDigit = 0
        var score = 0
        while n > 0 {
            let digitScore = digitRotationScore(n % 10)
            if digitScore == 0 {
                return false
            }
            score += digitScore
            numberOfDigit += 1
            n = n / 10
        }
        return score > numberOfDigit
    }

    func digitRotationScore(_ n: Int) -> Int {
        assert(n >= 0 && n < 10)
        if n == 2 || n == 5 || n == 6 || n == 9 {
            return 2
        } else if n == 1 || n == 0 || n == 8 {
            return 1
        } else {
            return 0
        }
    }

}
