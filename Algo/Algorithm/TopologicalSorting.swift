//
//  TopologicalSorting.swift
//  Algo
//
//  Created by Wei Zhang on 7/27/21.
//

import Foundation

class ToplogicalSorting {

    static func generateDAG() -> Graph {
        var graph = Graph()
        graph.addEdge(1, 2)
        graph.addEdge(1, 3)
        graph.addEdge(2, 7)
        graph.addEdge(3, 4)
        graph.addEdge(4, 5)
        graph.addEdge(4, 6)
        graph.addEdge(5, 7)
        graph.addEdge(6, 7)
        return graph
    }

    static func generateCycle() -> Graph {
        var graph = Graph()
        graph.addEdge(1, 2)
        graph.addEdge(2, 3)
        graph.addEdge(3, 1)
        graph.addEdge(4, 1)
        return graph
    }

    init(graph: Graph) {
        self.graph = graph
    }

    func sorted() throws -> [Int] {
        // reset all caches
        visited = [:]
        added = [:]
        sortedResult = []
        for n in graph.allNodes {
            if added[n] == nil {
                do {
                    try visit(n)
                } catch {
                    throw error
                }
            }
        }
        return sortedResult
    }

    private let graph: Graph
    private var visited: [Int: Bool] = [:]
    private var added: [Int: Bool] = [:]
    private var sortedResult: [Int] = []

    private func visit(_ node: Int) throws {
        if added[node] != nil {
            return
        }
        if visited[node] != nil {
            throw ToplogicalSortingError.notADAG
        }
        visited[node] = true
        for n in graph.edges(for: node) {
            do {
                try visit(n)
            } catch {
                throw error
            }
        }
        visited[node] = false
        sortedResult.insert(node, at: 0)
        added[node] = true
    }

}

enum ToplogicalSortingError: Error {
    case notADAG
}
