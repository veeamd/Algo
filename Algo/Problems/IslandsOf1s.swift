//
//  IslandsOf1s.swift
//  Algo
//
//  Created by Wei Zhang on 7/26/21.
//

import Foundation

/*
 input is a 2-d matrix of 1s
 find the number of islands that connected by 1s
 [[0, 0, 0, 0, 1],
  [1, 1, 0, 0, 1]
  [0, 0, 0, 0, 1]]
 The above matrix will return 2
 see: https://leetcode.com/problems/number-of-islands/
 */
@discardableResult
func numberOfIslandsOf1s(input: [[Int]]) -> Int {
    // going through the input iteratively once,
    // convert 2d index to 1d index
    // every index is a graph node.
    // nodes are connected with adjacent 1s
    // when walking through, we only need to look behind (both horizontally and vertically)
    let graph = convertToGraph(from: input)
    graph.printGraph()
    print("number of islands:")
    let num = graph.numberOfClusters()
    print(num)

    return num
}

func convertToGraph(from matrix: [[Int]]) -> Graph {
    var graph = Graph()
    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            let width = matrix[row].count
            if matrix[row][col] == 1 {
                let u = convert(row: row, col: col, rowWidth: width)
                graph.addNode(u)
                if valueAbove(row: row, col: col, matrix: matrix) == 1 {
                    let v = convert(row: row - 1, col: col, rowWidth: width)
                    graph.addEdge(u, v)
                    graph.addEdge(v, u)
                }
                if valueBehind(row: row, col: col, matrix: matrix) == 1 {
                    let v = convert(row: row, col: col - 1, rowWidth: width)
                    graph.addEdge(u, v)
                    graph.addEdge(v, u)
                }
            }
        }
    }
    return graph
}

func convert(row: Int, col: Int, rowWidth: Int) -> Int {
    row * rowWidth + col
}

func valueAbove(row: Int, col: Int, matrix: [[Int]]) -> Int {
    guard row > 0 else { return 0 }
    return matrix[row - 1][col]
}

func valueBehind(row: Int, col: Int, matrix: [[Int]]) -> Int {
    guard col > 0 else { return 0 }
    return matrix[row][col - 1]
}
