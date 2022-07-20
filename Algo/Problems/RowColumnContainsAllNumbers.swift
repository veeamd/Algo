//
//  RowColumnContainsAllNumbers.swift
//  Algo
//
//  Created by Wei Zhang on 4/25/22.
//

import Foundation
/**
 2133. Check if Every Row and Column Contains All Numbers
 An n x n matrix is valid if every row and every column contains all the integers from 1 to n (inclusive).

 Given an n x n integer matrix matrix, return true if the matrix is valid. Otherwise, return false.

 */
class RowColumnContainsAllNumbers {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        let count = matrix.count
        var rows: [Set<Int>] = Array(repeating: Set<Int>(), count: count)
        var columns: [Set<Int>] = Array(repeating: Set<Int>(), count: count)
        for i in 0..<count {
            for j in 0..<count {
                let e = matrix[i][j]
                guard e > 0 && e <= count && !rows[i].contains(e) && !columns[j].contains(e) else { return false }
                rows[i].insert(e)
                columns[j].insert(e)
            }
        }
        return true
    }
}
