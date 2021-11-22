//
//  SpecialStringAgain .swift
//  Algo
//
//  Created by Wei Zhang on 9/24/21.
//

import Foundation

// https://www.hackerrank.com/challenges/special-palindrome-again/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings

struct SpecialStringAgain {
    func substrCount(str: String) -> Int {
        var resultArr: [String] = []
        var result = 0
        guard str.count > 0 else {
            return result
        }
        let startIndex = str.startIndex
        var pointer = str.startIndex
        let endIndex = str.endIndex
        while pointer < endIndex {
            resultArr.append(String(str[pointer]))
            result += 1

            if pointer > startIndex {
                var left = str.index(before: pointer)
                var right = pointer
                let c = str[left]
                while left >= startIndex && right < endIndex {
                    if str[left] == c && str[right] == c {
                        resultArr.append(String(str[left...right]))
                        result += 1
                    } else {
                        break
                    }
                    if left > startIndex && right < endIndex {
                        left = str.index(before: left)
                        right = str.index(after: right)
                    } else {
                        break
                    }
                }
            }

            if pointer > startIndex && pointer < endIndex {
                var left = str.index(before: pointer)
                var right = str.index(after: pointer)
                let c = str[left]
                while left >= startIndex && right < endIndex {
                    if str[left] == c && str[right] == c {
                        resultArr.append(String(str[left...right]))
                        result += 1
                    } else {
                        break
                    }
                    if left > startIndex && right < endIndex {
                        left = str.index(before: left)
                        right = str.index(after: right)
                    } else {
                        break
                    }
                }
            }
            pointer = str.index(after: pointer)
        }
        return result
    }
}
