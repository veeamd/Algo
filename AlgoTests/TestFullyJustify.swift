//
//  TestFullyJustify.swift
//  AlgoTests
//
//  Created by Wei Zhang on 6/21/22.
//

import Foundation

import XCTest
@testable import Algo

class TestFullyJustify: XCTestCase {

    func testTestCase1() throws {
        let words = ["What","must","be","acknowledgment","shall","be"]
        let problem = FullyJustify()
        let result = problem.fullJustify(words, 16)

        print(result)
    }

}
