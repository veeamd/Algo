//
//  FullyJustify.swift
//  Algo
//
//  Created by Wei Zhang on 6/21/22.
//

import Foundation
class FullyJustify {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        // write down the requirements, translate that into pseudo code
        // 1. divide words into lines, not yet put them into actual lines
        // 2. calculate how many spaces we need for each works, put them into a line, watch out for when there is only one word
        // 3. special case: last line.
        var lines: [String] = []
        var wordsByLine: [String] = []
        var lineWidth = 0
        for word in words {
            lineWidth += word.count
            if lineWidth <= maxWidth {
                wordsByLine.append(word)
                lineWidth += 1
            } else {
                lines.append(addSpaces(to: wordsByLine, maxWidth))
                wordsByLine = [word]
                lineWidth = word.count + 1
            }
        }
        lines.append(addSpacesToLastLine(wordsByLine, maxWidth))
        return lines
    }

    func addSpaces(to words: [String], _ maxWidth: Int) -> String {
        var line = String()
        let lineWidth = words.reduce(0) { $0 + $1.count }
        let spacesLeft = maxWidth - lineWidth
        guard words.count > 1 else {
            line.append(words[0])
            line.append(String(repeating: " ", count: spacesLeft))
            return line
        }
        let spacesPerWord = spacesLeft / (words.count - 1)
        var extraSpaces = spacesLeft - spacesPerWord * (words.count - 1)
        for (index, word) in words.enumerated() {
            line.append(word)
            if index == words.count - 1 {
                break
            }
            line.append(String(repeating: " ", count: spacesPerWord))
            if extraSpaces > 0 {
                line.append(" ")
                extraSpaces -= 1
            }
        }
        return line
    }

    func addSpacesToLastLine(_ words: [String], _ maxWidth: Int) -> String {
        var line = String()
        for word in words {
            line.append(word)
            line.append(" ")
        }
        line = line.trimmingCharacters(in: .whitespaces)
        let lineWidth = line.count
        let remain = maxWidth - lineWidth
        if remain > 0 {
            line.append(String(repeating: " ", count: remain))
        }
        return line
    }
}
