//
//  TestSpecialStringAgain.swift
//  AlgoTests
//
//  Created by Wei Zhang on 9/25/21.
//

import XCTest
@testable import Algo

class TestSpecialStringAgain: XCTestCase {

    func testSpecialStringAgein() {
        XCTAssertEqual(SpecialStringAgain().substrCount(str: "asasd"), ["a", "s", "asa", "a", "sas", "s", "d"].count)
    }

    func testSpecialStringAgein2() {
        XCTAssertEqual(SpecialStringAgain().substrCount(str: ""), [].count)
    }

    func testSpecialStringAgein3() {
        XCTAssertEqual(SpecialStringAgain().substrCount(str: "a"), ["a"].count)
    }

    func testSpecialStringAgein4() {
        XCTAssertEqual(SpecialStringAgain().substrCount(str: "abc"), ["a", "b", "c"].count)
    }

    func testSpecialStringAgein5() {
        XCTAssertEqual(SpecialStringAgain().substrCount(str: "aaa"), ["a", "a", "aa", "aaa", "a", "aa"].count)
    }

    func testSpecialStringAgein6() {
        XCTAssertEqual(SpecialStringAgain().substrCount(str: "abcbaba"), ["a", "b", "c", "bcb", "b", "a", "bab", "b", "aba", "a"].count)
    }
}
