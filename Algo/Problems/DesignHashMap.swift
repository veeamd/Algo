//
//  DesignHashMap.swift
//  Algo
//
//  Created by Wei Zhang on 5/23/22.
//

import Foundation

// https://leetcode.com/problems/design-hashmap/
class MyHashMap {

    init() {
        for i in 0..<10 {
            nodes.append(StoreNode(key: i))
        }
    }

    func put(_ key: Int, _ value: Int) {
        child(for: key).put(key, value)
        print(nodes)
    }

    func get(_ key: Int) -> Int {
        child(for: key).get(key)
    }

    func remove(_ key: Int) {
        child(for: key).remove(key)
    }

    private var nodes: [StoreNode] = []

    private func child(for key: Int) -> StoreNode {
        return nodes[key % 10]
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */

class StoreNode {
    init(key: Int) {
        self.key = key
        children = [StoreNode]()
    }

    var value: Int?

    private let key: Int
    private var children: [StoreNode]

    func put(_ key: Int, _ value: Int) {
        if key / 10 == 0 {
            self.value = value
        } else {
            let nextKey = key / 10
            child(for: nextKey).put(nextKey, value)
        }
    }

    func get(_ key: Int) -> Int {
        if key / 10 == 0 {
            return value ?? -1
        } else {
            let nextKey = key / 10
            return child(for: nextKey).get(nextKey)
        }
    }

    func remove(_ key: Int) {
        if key / 10 == 0 {
            value = nil
        } else {
            let nextKey = key / 10
            return child(for: nextKey).remove(nextKey)
        }
    }

    private func child(for nextKey: Int) -> StoreNode {
        if children.isEmpty {
            for i in 0..<10 {
                children.append(StoreNode(key: i))
            }
        }
        return children[nextKey % 10]
    }
}
