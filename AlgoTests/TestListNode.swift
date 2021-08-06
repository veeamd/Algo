//
//  TestListNode.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/1/21.
//

import XCTest
@testable import Algo

class TestListNode: XCTestCase {

    func testFromLiteralArray() {
        let head: ListNode = [3, 5, 6]
        XCTAssertEqual(head.value, 3)
        XCTAssertEqual(head.next!.value, 5)
        XCTAssertEqual(head.next!.next!.value, 6)
        XCTAssertNil(head.next!.next!.next)
    }

    func testToArray() {
        let head: ListNode = [3, 5, 6]
        XCTAssertEqual(head.toArray(), [3, 5, 6])
    }

    func testReversed() {
        let head1: ListNode = [3]
        XCTAssertEqual(head1.reversed().toArray(), [3])
        let head2: ListNode = [3, 4]
        XCTAssertEqual(head2.reversed().toArray(), [4, 3])
        let head3: ListNode = [3, 4, 5]
        XCTAssertEqual(head3.reversed().toArray(), [5, 4, 3])
    }

}
