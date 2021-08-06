//
//  TestListNode2.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/1/21.
//

import XCTest
@testable import Algo

class TestListNode2: XCTestCase {

    func testFromLiteralArray() {
        let head: ListNode2 = [3, 5, 6]
        XCTAssertEqual(head.value, 3)
        XCTAssertEqual(head.next!.value, 5)
        XCTAssertEqual(head.next!.next!.value, 6)
        let tail = head.next!.next!
        XCTAssertEqual(tail.prev!.value, 5)
        XCTAssertEqual(tail.prev!.prev!.value, 3)
    }

    func testToArray() {
        let head: ListNode2 = [3, 5, 6]
        XCTAssertEqual(head.toArray(), [3, 5, 6])
    }

}
