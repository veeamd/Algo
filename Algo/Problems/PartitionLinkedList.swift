//
//  PartitionLinkedList.swift
//  Algo
//
//  Created by Wei Zhang on 8/1/21.
//

import Foundation

/// Partition a linked list around a valuex, such that all nodes less than x come before all nodes greater than or equal to x
class PartitionLinkedList {
    func partition(_ list: ListNode2, x: Int) -> ListNode2 {
        let nodeX = ListNode2(value: x)
        nodeX.next = list
        list.prev = nodeX

        // nodeX always points to value x noe
        // p runs the list
        // nodeX's next and prev to insert nodes before or after nodeX

        var p: ListNode2? = list
        while p != nil {
            let nextP = p?.next
            // remove p from its original place
            p!.prev?.next = p!.next
            p!.next?.prev = p!.prev

            var insertionLeft: ListNode2?
            var insertionRight: ListNode2?
            if p!.value >= x {
                insertionLeft = nodeX
                insertionRight = nodeX.next
            } else {
                insertionLeft = nodeX.prev
                insertionRight = nodeX
            }

            // insert p into the new place
            insertionLeft?.next = p
            p!.prev = insertionLeft
            p!.next = insertionRight
            insertionRight?.prev = p

            p = nextP
        }

        // find head
        p = nodeX
        while p?.prev != nil {
            p = p?.prev
        }

        // remove nodeX
        nodeX.prev?.next = nodeX.next
        nodeX.next?.prev = nodeX.prev

        return p!
    }
}
