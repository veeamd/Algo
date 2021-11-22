//
//  TestMinHeap.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/16/21.
//

import XCTest
@testable import Algo

class TestMinHeap: XCTestCase {
    var heap: MinHeap = [5, 10, 70, 10, 100, 60, 200, 60, 130, 200, 70, 80, 90, 80]

    func testToArray() {
        XCTAssertEqual(heap.toArray(), [5, 10, 10, 60, 60, 70, 70, 80, 80, 90, 100, 130, 200, 200])
    }

    func testPeekFromEmpty() {
        XCTAssertNil(MaxHeap().peek())
    }

    func testPeek() {
        XCTAssertEqual(heap.peek(), 5)
    }

    func testReplace() {
        heap.replace(8)
        XCTAssertEqual(heap.toArray(), [8, 10, 10, 60, 60, 70, 70, 80, 80, 90, 100, 130, 200, 200])
        heap.replace(40)
        XCTAssertEqual(heap.toArray(), [10, 10, 40, 60, 60, 70, 70, 80, 80, 90, 100, 130, 200, 200])
    }

}
