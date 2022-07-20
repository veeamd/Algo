//
//  TestRotateNumbers.swift
//  AlgoTests
//
//  Created by Wei Zhang on 4/8/22.
//

import XCTest
@testable import Algo

class TestRotateNumbers: XCTestCase {

    func test10() throws {
        let problem = RotateNumbers()
        let count = problem.rotatedDigits(10)
        XCTAssertEqual(count, 4)
    }

    func test15() throws {
        let problem = RotateNumbers()
        let count = problem.rotatedDigits(15)
        XCTAssertEqual(count, 6)
    }

}
