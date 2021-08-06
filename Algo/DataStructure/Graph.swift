//
//  Graph.swift
//  Algo
//
//  Created by Wei Zhang on 7/26/21.
//

import Foundation

struct Graph {

    /// Add an edge from `u` to `v`.
    /// All the edges are treated directed.
    /// It's the caller's responsibility to add `v` to `u` for an indirected graph
    mutating func addEdge(_ u: Int, _ v: Int) {
        ajacencyList.addEdge(u, v)
    }

    mutating func addNode(_ u: Int) {
        ajacencyList.addNode(u)
    }

    var allNodes: [Int] {
        ajacencyList.allNodes
    }

    func edges(for node: Int) -> [Int] {
        ajacencyList.edges(for: node)
    }

    func printGraph() {
        for u in allNodes {
            print("\(u): ", terminator: "")
            for v in edges(for: u) {
                print("\(v), ", terminator: "")
            }
            print()
        }
    }

    func numberOfClusters() -> Int {
        var clusters: Int = 0
        var visited: [Int: Bool] = [:]
        for u in allNodes {
            if !visited[u, default: false] {
                clusters += 1
                traverse(node: u, visited: &visited)
            }
        }
        return clusters
    }

    // MARK: - Private

    private var ajacencyList = AjacencyList()

    private func traverse(node: Int, visited: inout [Int: Bool]) {
        visited[node] = true
        for u in edges(for: node) {
            if !visited[u, default: false] {
                traverse(node: u, visited: &visited)
            }
        }
    }
}
