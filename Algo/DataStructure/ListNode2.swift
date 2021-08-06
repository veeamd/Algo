//
//  ListNode2.swift
//  Algo
//
//  Created by Wei Zhang on 8/1/21.
//

import Foundation

/// Doublely linked list node
class ListNode2: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Int

    var value: Int
    var next: ListNode2?
    var prev: ListNode2?

    init(value: Int, next: ListNode2? = nil, prev: ListNode2? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }

    required init(arrayLiteral elements: Int...) {
        guard elements.count > 0 else {
            fatalError("Can't create a linked list from empty array")
        }
        value = elements[0]
        var p = self
        for i in elements[1...] {
            let node = ListNode2(value: i)
            node.prev = p
            p.next = node
            p = node
        }
    }

    func toArray() -> [Int] {
        var arr: [Int] = []
        var p: ListNode2? = self
        while p != nil {
            arr.append(p!.value)
            p = p!.next
        }
        return arr
    }
}
