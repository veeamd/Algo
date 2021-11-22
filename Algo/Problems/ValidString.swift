//
//  ValidString.swift
//  Algo
//
//  Created by Wei Zhang on 9/20/21.
//

import Foundation

func isValid(s: String) -> String {
    let utf8s = s.utf8
    var utf8Count = Array(repeating: 0, count: 26)

    for utf8 in utf8s {
        let index = Int(utf8) - 97
        utf8Count[index] += 1
    }

    var letterCountVariance: [Int: Int] = [:]
    for count in utf8Count {
        if count == 0 {
            continue
        }
        let exist = letterCountVariance[count, default: 0]
        letterCountVariance[count] = exist + 1
    }

    if letterCountVariance.count >= 3 {
        return "NO"
    } else {
        if letterCountVariance.keys.count == 1 {
            return "YES"
        } else {
            let sortedKeys = letterCountVariance.keys.sorted(by: <)
            let largerKey = sortedKeys[1]
            let smallerKey = sortedKeys[0]
            print(sortedKeys)
            if largerKey - smallerKey == 1 && letterCountVariance[largerKey] == 1 {
                return "YES"
            } else if smallerKey == 1 && letterCountVariance[smallerKey] == 1 {
                return "YES"
            }
        }
    }
    return "NO"
}

