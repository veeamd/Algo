//
//  TestMinimumWorkSessions.swift
//  TestMinimumWorkSessions
//
//  Created by Wei Zhang on 8/31/21.
//

import XCTest
@testable import Algo

class TestMinimumWorkSessions: XCTestCase {

    func testMinSessions() {
        XCTAssertEqual(minSessions([1, 2, 3, 4, 4], 5), 3)
    }

    func testMinSessions2() {
        XCTAssertEqual(minSessions([1,5,7,10,3,8,4,2,6,2], 10), 5)
    }

    func testMinSessions3() {
        XCTAssertEqual(minSessions([1], 12), 1)
    }

    func testMinSessions4() {
        XCTAssertEqual(minSessions([2,3,3,4,4,4,5,6,7,10], 12), 4)
    }
}
