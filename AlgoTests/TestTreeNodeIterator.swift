//
//  TestTreeNodeIterator.swift
//  AlgoTests
//
//  Created by Wei Zhang on 5/1/22.
//

import XCTest
@testable import Algo

class TestTreeNodeIterator: XCTestCase {

    func testIterator() {
        let f = createTree()
        let array = Array(f)
        let target = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        XCTAssertEqual(array, target)
    }

    func testConverter() {
        let f = createTree()
        let array = SameTree().convertToArray(f)
        let target = [1, 2, 3, 4, 5, 6, nil, 7, 8, 9, nil]
        XCTAssertEqual(array, target)
    }
    /// Create a tree like the following:
    ///
    ///                  f
    ///                 / \
    ///                b   g
    ///               / \   \
    ///              a   d   i
    ///                 / \  /
    ///                c   e h
    private func createTree() -> TreeNode {
        let a = TreeNode(1)
        let b = TreeNode(2)
        b.left = a
        let c = TreeNode(3)
        let e = TreeNode(5)
        let d = TreeNode(4, c, e)
        b.right = d
        let h = TreeNode(8)
        let i = TreeNode(9)
        i.left = h
        let g = TreeNode(7, nil, i)
        let f = TreeNode(6, b, g)
        return f
    }
}
