//
//  StackWithMinValue.swift
//  Algo
//
//  Created by Wei Zhang on 8/3/21.
//

import Foundation

struct StackWithMinValue<T> where T: Comparable {

    var count: Int {
        storage.count
    }

    func peek() -> T? {
        storage.last?.value
    }

    func min() -> T? {
        storage.last?.min
    }

    mutating func pop() -> T {
        storage.removeLast().value
    }

    mutating func push(_ value: T) {
        var newMin = value
        if let currentMin = min() {
            newMin = Swift.min(currentMin, value)
        }
        storage.append(Element(value: value, min: newMin))
    }

    private var storage: Array<Element> = []

    struct Element {
        let value: T
        let min: T
    }
}

extension StackWithMinValue: ExpressibleByArrayLiteral {

    typealias ArrayLiteralElement = T

    init(arrayLiteral elements: T...) {
        for element in elements {
            push(element)
        }
    }
}
