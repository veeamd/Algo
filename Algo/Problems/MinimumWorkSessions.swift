//
//  MinimumWorkSessions.swift
//  MinimumWorkSessions
//
//  Created by Wei Zhang on 8/30/21.
//

import Foundation
// https://leetcode.com/contest/weekly-contest-256/problems/minimum-number-of-work-sessions-to-finish-the-tasks/
/*
 Constraints:

 n == tasks.length
 1 <= n <= 14
 1 <= tasks[i] <= 10
 max(tasks[i]) <= sessionTime <= 15
 */
func minSessions(_ tasks: [Int], _ sessionTime: Int) -> Int {
    var taskDurations: [Int] = Array(repeating: 0, count: 11)
    var bound = 0
    for task in tasks {
        taskDurations[task] += 1
        if task > bound {
            bound = task
        }
    }
    var sessionCount = 0
    var reminder = sessionTime
    while bound > 0 {
        var nextLargest = min(reminder, bound)
        while reminder > 0 && nextLargest > 0 {
            if taskDurations[nextLargest] > 0 {
                reminder -= nextLargest
                taskDurations[nextLargest] -= 1
                nextLargest = min(reminder, bound)
            } else {
                nextLargest -= 1
            }
        }
        // reset
        sessionCount += 1
        reminder = sessionTime
        while taskDurations[bound] == 0 && bound > 0 {
            bound -= 1
        }
    }
    return sessionCount
}
