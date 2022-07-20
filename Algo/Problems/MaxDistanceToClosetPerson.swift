//
//  MaxDistanceToClosetPerson.swift
//  Algo
//
//  Created by Wei Zhang on 4/8/22.
//

import Foundation

class MaxDistanceToClosestPerson {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var maxClosest: Int = .min

        var allIndexOf1s: [Int] = []
        for (index, i) in seats.enumerated() {
            if i == 1 {
                allIndexOf1s.append(index)
            }
        }

        guard allIndexOf1s.count > 0 else { return 0 }
        if allIndexOf1s[0] != 0 {
            maxClosest = max(maxClosest, allIndexOf1s[0])
        }
        if allIndexOf1s.last! != seats.endIndex - 1 {
            maxClosest = max(maxClosest, seats.endIndex - 1 - allIndexOf1s.last!)
        }

        guard allIndexOf1s.count > 1 else { return maxClosest }

        var rightIndex = 1
        while rightIndex < allIndexOf1s.endIndex {
            let left = allIndexOf1s[rightIndex - 1]
            let right = allIndexOf1s[rightIndex]
            maxClosest = max(maxClosest, (right - left) / 2)
            rightIndex += 1
        }
        return maxClosest
    }

}
