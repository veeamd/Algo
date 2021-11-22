//
//  TestExtraLongFactorial.swift
//  AlgoTests
//
//  Created by Wei Zhang on 10/2/21.
//

import XCTest
@testable import Algo

class TestExtraLongFactorial: XCTestCase {

    func testExample() {
        XCTAssertEqual(extraLongFactorials(n: 25), "15511210043330985984000000")
    }

    func testAdd() {
        XCTAssertEqual(Algo.add([0], [2, 4]), [2, 4])
    }

    func testCase1() {
        XCTAssertEqual(extraLongFactorials(n: 1), "1")
    }

    func testCase100() {
        XCTAssertEqual(extraLongFactorials(n: 100), "1")
    }
}
