//
//  SameTree.swift
//  Algo
//
//  Created by Wei Zhang on 5/2/22.
//

import Foundation

class SameTree {

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//        let arrayP = convertToArray(p)
//        let arrayQ = convertToArray(q)
//        return arrayP == arrayQ
        if let p = p, let q = q {
            return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
        } else if p == nil && q == nil {
            return true
        } else {
            return false
        }
    }

    public func convertToArray(_ node: TreeNode?) -> [Int?] {
        var result: [Int?] = []
        var stack: [TreeNode] = []
        var node = node

        while node != nil || !stack.isEmpty {
            if node != nil {
                stack.append(node!)
                node = node!.left
            } else {
                node = stack.removeLast()
                let left = node?.left
                let right = node?.right
                if left == nil && right != nil {
                    result.append(nil)
                }
                result.append(node!.val)
                node = node!.right
                if left != nil && right == nil {
                    result.append(nil)
                }
            }
        }
        return result
    }
}
