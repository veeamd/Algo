//
//  AjacencyList.swift
//  Algo
//
//  Created by Wei Zhang on 7/26/21.
//

import Foundation

struct AjacencyList {

    var allNodes: [Int] {
        Array(storage.keys)
    }

    func edges(for node: Int) -> [Int] {
        let edges = storage[node] ?? []
        return Array(edges)
    }

    /// Add an edge from `u` to `v`.
    /// All the edges are treated directed.
    /// It's the caller's responsibility to add `v` to `u` for an indirected graph
    mutating func addEdge(_ u: Int, _ v: Int) {
        if storage[u] != nil {
            storage[u]!.insert(v)
        } else {
            var edges: Set<Int> = []
            edges.insert(v)
            storage[u] = edges
        }
    }

    mutating func addNode(_ u: Int) {
        if storage[u] == nil {
            storage[u] = Set()
        }
    }

    private var storage: [Int: Set<Int>] = [:]
}
