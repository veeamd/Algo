//
//  TestNodeReachableInDigraph.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/5/21.
//

import XCTest
@testable import Algo

class TestNodeReachableInDigraph: XCTestCase {

    func testReachable() {
        var graph = Graph()
        graph.addEdge(1, 2)
        graph.addEdge(2, 3)
        graph.addEdge(3, 1)
        graph.addEdge(3, 4)
        let reachable = NodeReachableInDigraph(graph: graph)
        XCTAssertTrue(reachable.reachable(from: 1, to: 4))
    }

}
