//
//  Stack.swift
//  Algo
//
//  Created by Wei Zhang on 8/2/21.
//

import Foundation

struct Stack<T> {

    var count: Int {
        storage.count
    }

    func peek() -> T? {
        storage.last
    }

    mutating func pop() -> T {
        storage.removeLast()
    }

    mutating func push(_ value: T) {
        storage.append(value)
    }

    private var storage: Array<T> = []
}
