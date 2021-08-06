//
//  TestPartitionLinkedList.swift
//  AlgoTests
//
//  Created by Wei Zhang on 8/2/21.
//

import XCTest
@testable import Algo

class TestPartitionLinkedList: XCTestCase {

    func testPartitionLinkedList() {
        let list: ListNode2 = [5, 3, 2, 4, 2, 6, 4]
        let partition = PartitionLinkedList()
        let newList = partition.partition(list, x: 4)
        XCTAssertEqual(newList.toArray(), [3, 2, 2, 4, 6, 4, 5])
    }

}
