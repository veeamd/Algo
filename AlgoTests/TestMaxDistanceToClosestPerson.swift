//
//  TestMaxDistanceToClosestPerson.swift
//  AlgoTests
//
//  Created by Wei Zhang on 4/9/22.
//

import XCTest
@testable import Algo

class TestMaxDistanceToClosestPerson: XCTestCase {

    func testFirstIndex0() {
        var seats = [0, 1]
        let problem = MaxDistanceToClosestPerson()
        XCTAssertEqual(problem.maxDistToClosest(seats), 1)

        seats = [0, 0, 0, 1]
        XCTAssertEqual(problem.maxDistToClosest(seats), 3)
    }

    func testLastIndex0() {
        var seats = [1, 0]
        let problem = MaxDistanceToClosestPerson()
        XCTAssertEqual(problem.maxDistToClosest(seats), 1)

        seats = [1, 0, 0, 0]
        XCTAssertEqual(problem.maxDistToClosest(seats), 3)
    }

    func testBothSides0() {
        var seats = [0, 0, 1, 0]
        let problem = MaxDistanceToClosestPerson()
        XCTAssertEqual(problem.maxDistToClosest(seats), 2)

        seats = [0, 1, 0, 0]
        XCTAssertEqual(problem.maxDistToClosest(seats), 2)

        seats = [0, 1, 0, 1, 0, 0]
        XCTAssertEqual(problem.maxDistToClosest(seats), 2)

        seats = [0, 1, 0, 0, 0, 0, 0, 1, 0, 0]
        XCTAssertEqual(problem.maxDistToClosest(seats), 3)
    }

    func testBothSides1() {
        var seats = [1, 0, 1]
        let problem = MaxDistanceToClosestPerson()
        XCTAssertEqual(problem.maxDistToClosest(seats), 1)

        seats = [1, 0, 0, 0, 0, 0, 1]
        XCTAssertEqual(problem.maxDistToClosest(seats), 3)

        seats = [1, 0, 0, 0, 0, 1]
        XCTAssertEqual(problem.maxDistToClosest(seats), 2)

        seats = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]
        XCTAssertEqual(problem.maxDistToClosest(seats), 3)

        seats = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
        XCTAssertEqual(problem.maxDistToClosest(seats), 3)
    }

}
