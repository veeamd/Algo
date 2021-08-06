//
//  TestStackWithMin.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/3/21.
//

import XCTest
@testable import Algo

class TestStackWithMin: XCTestCase {

    func testStack() {
        var stack: StackWithMinValue<Int> = [6, 5, 7, 4]
        XCTAssertEqual(stack.min(), 4)
        XCTAssertEqual(stack.peek(), 4)
        XCTAssertEqual(stack.pop(), 4)

        XCTAssertEqual(stack.min(), 5)
        XCTAssertEqual(stack.peek(), 7)
        XCTAssertEqual(stack.pop(), 7)

        XCTAssertEqual(stack.min(), 5)
        XCTAssertEqual(stack.peek(), 5)
        XCTAssertEqual(stack.pop(), 5)

        XCTAssertEqual(stack.min(), 6)
        XCTAssertEqual(stack.peek(), 6)
        XCTAssertEqual(stack.pop(), 6)
    }

}
