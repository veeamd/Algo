//
//  TestLinkedListAddition.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/2/21.
//

import XCTest
@testable import Algo

class TestLinkedListAddition: XCTestCase {

    func testExample() throws {
        let l1: ListNode = [6, 1, 7]
        let l2: ListNode = [2, 9, 7]
        let l3 = LinkedListAddition().add(l1, l2)
        XCTAssertEqual(l3?.toArray(), [8, 0, 5, 1])

        let l4: ListNode = [1]
        let l5 = LinkedListAddition().add(l1, l4)
        XCTAssertEqual(l5?.toArray(), [7, 1, 7])
    }

}
