//
//  TestDesignHashMap.swift
//  AlgoTests
//
//  Created by Wei Zhang on 5/23/22.
//

import XCTest
@testable import Algo

class TestDesignHashMap: XCTestCase {

    func testLessThan10() throws {
        let hash = MyHashMap()
        hash.put(1, 1)
        hash.put(2, 2)
        XCTAssertEqual(hash.get(1), 1)
        hash.remove(1)
        XCTAssertEqual(hash.get(1), -1)
        hash.put(254, 2)
        XCTAssertEqual(hash.get(254), 2)
    }

    func test3Digits() throws {
        let hash = MyHashMap()
        hash.put(254, 2)
        XCTAssertEqual(hash.get(254), 2)
        hash.put(253, 3)
        XCTAssertEqual(hash.get(253), 3)
        hash.remove(253)
        XCTAssertEqual(hash.get(253), -1)
        hash.put(254, 5)
        XCTAssertEqual(hash.get(254), 5)
    }

}
