//
//  MinimumBribes.swift
//  Algo
//
//  Created by Wei Zhang on 9/19/21.
//

import Foundation

// https://www.hackerrank.com/challenges/new-year-chaos/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays
class MinimumBribes {
    /*
     * Complete the 'minimumBribes' function below.
     *
     * The function accepts INTEGER_ARRAY q as parameter.
     */

    func minimumBribes(q: [Int]) -> Int {
        // position -> number
        // TODO: use an assistive array to track changes
        var positionNumber: [Int: Int] = [:]
        let maxNumber = q.count
        for number in 1...maxNumber {
            positionNumber[number] = number
        }
        var totalBribes = 0
        for (index, number) in q.enumerated() {
            let orderedPositionNumber = positionNumber.sorted { $0.key < $1.key }.map { $0.value }
            print(orderedPositionNumber)
            let (originalPosition, _) = positionNumber.first(where: { _, value in
                value == number
            })!
            let newPosition = index + 1
            let offset = newPosition - originalPosition
            if offset <= -3 {
                return -1
            } else if offset < 0 {
                totalBribes += -offset
                positionNumber[originalPosition] = positionNumber[originalPosition - 1]
                if offset == -2 {
                    positionNumber[originalPosition - 1] = positionNumber[originalPosition - 2]
                }
                positionNumber[originalPosition + offset] = number

            }
        }
        return totalBribes
    }
}
