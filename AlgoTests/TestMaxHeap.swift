//
//  HeapTest.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/1/21.
//

import XCTest
@testable import Algo

class TestMaxHeap: XCTestCase {
    var heap: MaxHeap = [5, 10, 70, 10, 100, 60, 200, 60, 130, 200, 70, 80, 90, 80]

    func testToArray() {
        XCTAssertEqual(heap.toArray(), [200, 200, 130, 100, 90, 80, 80, 70, 70, 60, 60, 10, 10, 5])
    }

    func testPeekFromEmpty() {
        XCTAssertNil(MaxHeap().peek())
    }

    func testPeek() {
        XCTAssertEqual(heap.peek(), 200)
    }

    func testReplace() {
        heap.replace(150)
        XCTAssertEqual(heap.toArray(), [200, 150, 130, 100, 90, 80, 80, 70, 70, 60, 60, 10, 10, 5])
        heap.replace(40)
        XCTAssertEqual(heap.toArray(), [150, 130, 100, 90, 80, 80, 70, 70, 60, 60, 40, 10, 10, 5])
    }

}
