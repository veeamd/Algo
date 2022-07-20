//
//   PartialUnsorted.swift
//  Algo
//
//  Created by Wei Zhang on 8/15/21.
//

import Foundation

/// Give an array of integers, write a method to find indices `m` and `n` such that if you sorted elements `m` through `n`,
/// the entire array would be sorted, minimize `n` - `m` (that is find the smallest such sequence).
/// Example
/// input 1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19
/// Output (3, 9)
class PartialUnsorted {
    init(array: [Int]) {
        theArray = array
    }

    func findMandN() -> (Int, Int) {
        var minHeap = MinHeap(array: theArray)
        var m = 0
        while m < theArray.count {
            if theArray[m] == minHeap.pop() {
                m += 1
            } else {
                break
            }
        }
        var maxHeap = MaxHeap(array: theArray)
        var n = theArray.count - 1
        while n >= 0 {
            if theArray[n] == maxHeap.pop() {
                n -= 1
            } else {
                break
            }
        }
        return (m, n)
    }

    private let theArray: [Int]
}
