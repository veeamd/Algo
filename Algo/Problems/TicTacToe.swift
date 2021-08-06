//
//  TicTacToe.swift
//  Algo
//
//  Created by Wei Zhang on 8/5/21.
//

import Foundation

class TicTacToe {
    init(startsWithCircle: Bool = false) {
        isCirclesTurn = startsWithCircle
    }

    func markAt(_ row: Int, _ col: Int) -> Bool {
        guard (0..<3).contains(row) && (0..<3).contains(col) else { return false }
        guard board[row][col] == .empty else { return false }
        board[row][col] = mark
        return true
    }

    func checkWinner() {
        if checkBoard() {
            print("We have a winner, winner is \(mark)")
        }
    }

    func nextTurn() {
        isCirclesTurn.toggle()
    }

    private var isCirclesTurn: Bool
    private var mark: String {
        isCirclesTurn ? .circle : .cross
    }
    private var board = [[String]](repeating: [.empty, .empty, .empty], count: 3)

    private func checkBoard() -> Bool {
        return checkRows() || checkColumns() || checkDiagonals()
    }

    private func checkRows() -> Bool {
        for r in 0..<3 {
            if board[r][0] == board[r][1] && board[r][1] == board[r][2] {
                return true
            }
        }
        return false
    }

    private func checkColumns() -> Bool {
        for c in 0..<3 {
            if board[0][c] == board[1][c] && board[1][c] == board[2][c] {
                return true
            }
        }
        return false
    }

    private func checkDiagonals() -> Bool {
        if board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return true
        } else if board[2][0] == board[1][1] && board[1][1] == board[0][2] {
            return true
        } else {
            return false
        }
    }
}

extension String {
    static let circle = "O"
    static let cross = "X"
    static let empty = " "
}

