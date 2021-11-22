//
//  SolveFormulas.swift
//  Algo
//
//  Created by Wei Zhang on 9/29/21.
//

import Foundation
/*
 Question Description

 Given a set of formulas containing integers and variable strings, output the value of all variables.

 For example if the input is:

 D = C + B + 2

 C = 5 + A

 B = A + 2

 A = 3

 Then you can figure out that

 A = 3

 B = 5

 C = 8

 D = 15

 The formulas have the following constraints:

 The formula will only contain additions (+). There is no subtraction, multiplication or division.
 The left hand side of the equation will always be a single variable string.
 You will never get a formula that looks like A + 3 = B + 5
 Each variable will show up exactly once on the left hand side of the equation
 So you will never have something like this in the input
 A = B + 3
 A = C + 5
 Each variable will be guaranteed to be solvable.
 The formulas can be in any order


 Input Specifications:

 The first line in the input will contain a single integer N (1 <= N <= 10) that denotes the number of formulas in the input.

 To make parsing simple, the input will be space delimited.

 For example, D = C + B + 2 will be input as D C B 2

 Output Specifications:

 Print the variables values sorted by largest variable value first. If multiple variables have the same value, output the one that comes earlier in the alphabet first.

 Sample Input

 4
 D C B 2
 C 5 A
 B A 2
 A 3

 Sample Output

 D 15
 C 8
 B 5
 A 3
 */

class SolveFormulas {
    init(input: [String]) {
        formulas = [:]
        for str in input {
            let formula = Formula(string: str)
            formulas[formula.variable] = formula
        }
    }

    func solve() -> [String] {
        for (_, formula) in formulas {
            solveRecusively(formula: formula)
        }

        return memo.sorted { $0.value > $1.value || ($0.value == $1.value && $0.key < $1.key) }
            .map { "\($0) \($1)"}
    }

    private var memo: [String: Int] = [:]
    private var formulas: [String: Formula]

    @discardableResult
    private func solveRecusively(formula: Formula) -> Int {
        if let existValue = memo[formula.variable] {
            return existValue
        }
        var result = 0
        for component in formula.components {
            switch component {
            case .value(let v):
                result += v
            case .variable(let v):
                result += solveRecusively(formula: formulas[v]!)
            }
        }
        memo[formula.variable] = result
        return result
    }
}

extension SolveFormulas {
    class Formula {
        let variable: String
        var components: [Component]

        init(string: String) {
            var elements = string.components(separatedBy: .whitespaces)
            variable = elements.removeFirst()
            components = []
            for element in elements {
                if let value = Int(element) {
                    components.append(.value(value))
                } else {
                    components.append(.variable(element))
                }
            }
        }
    }

    enum Component {
        case variable(String)
        case value(Int)
    }
}
