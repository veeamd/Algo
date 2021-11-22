//
//  NodeReachableInDigraph.swift
//  Algo
//
//  Created by Wei Zhang on 8/4/21.
//

import Foundation

class NodeReachableInDigraph {
    init(graph: Graph) {
        self.graph = graph
    }

    func reachable(from: Int, to: Int) -> Bool {
        isReachable = false
        visited = [:]
        dfs(from: from, to: to)
        return isReachable
    }

    // MARK: - Private

    private let graph: Graph
    private var visited: [Int: Bool]!
    private var isReachable: Bool = false

    private func dfs(from: Int, to: Int) {
        dfsVisit(from, to: to)
    }

    private func dfsVisit(_ node: Int, to: Int) {
        guard visited[node, default: false] == false else { return }
        visited[node] = true
        if node == to {
            isReachable = true
            return
        }
        for e in graph.edges(for: node) {
            dfsVisit(e, to: to)
        }
    }
}
