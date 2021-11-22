//
//  TestMunimumBribes.swift
//  AlgoTests
//
//  Created by Wei Zhang on 9/19/21.
//

import XCTest
@testable import Algo

class TestMunimumBribes: XCTestCase {

    func testBribes() throws {
        let problem = MinimumBribes()
        XCTAssertEqual(problem.minimumBribes(q: [1,2,5,3,7,8,6,4]), 7)
    }
}
