//
//  TestpartialUnsorted.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/16/21.
//

import XCTest
@testable import Algo

class TestpartialUnsorted: XCTestCase {

    func testIt() {
        let problem = PartialUnsorted(array: [1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19])
        let (m, n) = problem.findMandN()
        XCTAssertEqual(m, 3)
        XCTAssertEqual(n, 9)
    }

}
