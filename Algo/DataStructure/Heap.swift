import Foundation

struct Heap {

    enum Variant {
        case max
        case min
    }

    init(variant: Variant) {
        self.variant = variant
        switch variant {
        case .max:
            compare = { left, right in left > right }
        case .min:
            compare = { left, right in left < right }
        }
        storage = []
    }

    init(array: [Int], variant: Variant) {
        self.init(variant: variant)
        storage = array
        heapify()
    }

    var count: Int {
        storage.count
    }

    func peek() -> Int? {
        storage.first
    }

    mutating func pop() -> Int {
        assert(storage.count > 0, "popping from an empty heap")
        let result = storage.first!
        storage.swapAt(0, storage.count - 1)
        storage.remove(at: count - 1)
        if count > 0 {
            sink(0)
        }
        return result
    }

    /// replace the root with `value`
    @discardableResult
    mutating func replace(_ value: Int) -> Int {
        assert(storage.count > 0, "replacing value in an empty heap")
        let result = storage.first!
        storage[0] = value
        sink(0)
        return result
    }

    func toArray() -> [Int] {
        var copy = self
        var result: [Int] = []
        while copy.count > 0 {
            result.append(copy.pop())
        }
        return result
    }

    // MARK: - Private

    private var storage: [Int]
    private let variant: Variant
    private let compare: (Int, Int) -> Bool

    private mutating func heapify() {
        guard storage.count > 1 else { return }
        var index = 1
        while index < storage.count {
            swim(index)
            index += 1
        }
    }

    private func parent(of index: Int) -> Int {
        assert(index > 0, "no parent for root")
        return Int(floor((Double(index) - 1) / 2))
    }

    private func leftChildIndex(of index: Int) -> Int {
        2 * index + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        2 * index + 2
    }

    private func value(of index: Int) -> Int? {
        if index >= count {
            return nil
        } else {
            return storage[index]
        }
    }

    /// return true if `index1` value is greater than of `index2`; nil value is smaller than any non-nil value
    private func compareForSinking(_ index1: Int, _ index2: Int) -> Bool {
        let value1 = value(of: index1)
        let value2 = value(of: index2)
        if value1 == nil && value2 == nil {
            return false
        } else if value1 == nil {
            return false
        } else if value2 == nil {
            return true
        } else {
            return compare(value1!, value2!)
        }
    }

    private mutating func swim(_ index: Int) {
        guard index > 0 else { return }
        let parent = parent(of: index)
        if compare(storage[index], storage[parent]) {
            storage.swapAt(index, parent)
            swim(parent)
        }
    }

    private mutating func sink(_ index: Int) {
        let leftIndex = leftChildIndex(of: index)
        let rightIndex = rightChildIndex(of: index)
        if compareForSinking(index, leftIndex) && compareForSinking(index, rightIndex) {
            return
        }
        var nextIndex = leftIndex
        if compareForSinking(rightIndex, leftIndex) {
            nextIndex = rightIndex
        }
        storage.swapAt(index, nextIndex)
        sink(nextIndex)
    }
}

struct MaxHeap: ExpressibleByArrayLiteral {

    typealias ArrayLiteralElement = Int

    init() {
        storage = Heap(variant: .max)
    }

    init(array: [Int]) {
        storage = Heap(array: array, variant: .max)
    }

    init(arrayLiteral elements: Int...) {
        self.init(array: elements)
    }

    var count: Int {
        storage.count
    }

    func peek() -> Int? {
        storage.peek()
    }

    mutating func pop() -> Int {
        storage.pop()
    }

    /// replace the root with `value`
    @discardableResult
    mutating func replace(_ value: Int) -> Int {
        storage.replace(value)
    }

    func toArray() -> [Int] {
        storage.toArray()
    }

    private var storage: Heap
}

struct MinHeap: ExpressibleByArrayLiteral {

    typealias ArrayLiteralElement = Int

    init() {
        storage = Heap(variant: .min)
    }

    init(array: [Int]) {
        storage = Heap(array: array, variant: .min)
    }

    init(arrayLiteral elements: Int...) {
        self.init(array: elements)
    }

    var count: Int {
        storage.count
    }

    func peek() -> Int? {
        storage.peek()
    }

    mutating func pop() -> Int {
        storage.pop()
    }

    /// replace the root with `value`
    @discardableResult
    mutating func replace(_ value: Int) -> Int {
        storage.replace(value)
    }

    func toArray() -> [Int] {
        storage.toArray()
    }

    private var storage: Heap
}
