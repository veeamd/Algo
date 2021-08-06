//
//  LinkedListAddition.swift
//  Algo
//
//  Created by Wei Zhang on 8/2/21.
//

import Foundation

class LinkedListAddition {
    func add(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry: Int = 0
        var p1 = l1
        var p2 = l2
        let resultHead: ListNode = ListNode(value: 0)
        var p3 = resultHead
        while p1 != nil || p2 != nil {
            let v1 = p1?.value ?? 0
            let v2 = p2?.value ?? 0
            let sum = v1 + v2 + carry
            carry = sum / 10
            let node = ListNode(value: sum % 10)
            p3.next = node
            p3 = node
            p1 = p1?.next
            p2 = p2?.next
        }
        if carry > 0 {
            let node = ListNode(value: carry)
            p3.next = node
        }

        return resultHead.next
    }
}
