//
//  ListNode.swift
//  Algo
//
//  Created by Wei Zhang on 8/1/21.
//

import Foundation

/// Singlely linked list node
class ListNode: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Int

    var value: Int
    var next: ListNode?

    init(value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }

    required init(arrayLiteral elements: Int...) {
        guard elements.count > 0 else {
            fatalError("Can't create a linked list from empty array")
        }
        value = elements[0]
        var p = self
        for i in elements[1...] {
            let node = ListNode(value: i)
            p.next = node
            p = node
        }
    }

    func toArray() -> [Int] {
        var arr: [Int] = []
        var p: ListNode? = self
        while p != nil {
            arr.append(p!.value)
            p = p!.next
        }
        return arr
    }

    func reversed() -> ListNode {
        var p1 = self
        var p2 = p1.next
        var p3 = p2?.next
        p1.next = nil
        while p2 != nil {
            p2?.next = p1
            p1 = p2!
            p2 = p3
            p3 = p2?.next
        }
        return p1
    }
}
