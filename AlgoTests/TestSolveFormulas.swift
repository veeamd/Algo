//
//  TestSolveFormulas.swift
//  AlgoTests
//
//  Created by Wei Zhang on 9/29/21.
//

import XCTest
@testable import Algo

class TestSolveFormulas: XCTestCase {

    func testIt() {
        let problem = SolveFormulas(input: ["D C B 2",
                                            "C 5 A",
                                            "B A 2",
                                            "A 3"])
        let result = problem.solve()
        XCTAssertEqual(result, ["D 15", "C 8", "B 5", "A 3"])
    }

    func testIt2() {
        let problem = SolveFormulas(input: ["D C B 2",
                                            "C 2 A",
                                            "B A 5",
                                            "A 3"])
        let result = problem.solve()
        XCTAssertEqual(result, ["D 15", "B 8", "C 5", "A 3"])
    }

    func testIt3() {
        let problem = SolveFormulas(input: ["D C B 2",
                                            "C 2 A",
                                            "B A 2",
                                            "A 3"])
        let result = problem.solve()
        XCTAssertEqual(result, ["D 12", "B 5", "C 5", "A 3"])
    }

}
