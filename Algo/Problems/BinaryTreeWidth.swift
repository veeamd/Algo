//
//  BinaryTreeWidth.swift
//  Algo
//
//  Created by Wei Zhang on 5/25/22.
//

import Foundation
class BinaryTreeWidth {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        node.val = 1
        var queue: [TreeNode] = [node]
        var width = 1
        while !queue.isEmpty {
            var newQueue: [TreeNode] = []
            for node in queue {
                if node.left != nil {
                    let left = node.left!
                    left.val = node.val * 2 - 1
                    newQueue.append(left)
                }
                if node.right != nil {
                    let right = node.right!
                    right.val = node.val * 2
                    newQueue.append(right)
                }
            }
            if newQueue.count >= 2 {
                let newWidth = newQueue.last!.val - newQueue.first!.val + 1
                width = max(width, newWidth)
            }
            queue = newQueue
        }
        return width
    }
}
