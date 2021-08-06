//
//  HeapTest.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/1/21.
//

import XCTest
@testable import Algo

class TestHeap: XCTestCase {
    var heap: Heap = [5, 10, 70, 100, 60, 200, 130, 80, 90, 80]

    func testToArray() {
        XCTAssertEqual(heap.toArray(), [200, 130, 100, 90, 80, 80, 70, 60, 10, 5])
    }

    func testPeekFromEmpty() {
        XCTAssertNil(Heap().peek())
    }

    func testPeek() {
        XCTAssertEqual(heap.peek(), 200)
    }

    func testReplace() {
        heap.replace(150)
        XCTAssertEqual(heap.toArray(), [150, 130, 100, 90, 80, 80, 70, 60, 10, 5])
        heap.replace(40)
        XCTAssertEqual(heap.toArray(), [130, 100, 90, 80, 80, 70, 60, 40, 10, 5])
    }

}
