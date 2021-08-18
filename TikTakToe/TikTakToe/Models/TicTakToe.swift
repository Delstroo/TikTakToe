
//
//  TicTakToe.swift
//  TikTakToe
//
//  Created by Delstun McCray on 8/18/21.
//

import Foundation

class TikTakToe {
    
    
    public enum GameState : String {
        case xTurn = "X's turn"
        case oTurn = "O's turn"
        case draw = "Tie Game."
        case xWin = "X's Win!"
        case oWin = "O's Win!"
    }
    
    public var board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    
    public func resetBoard() {
        board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    }
    
    private let winningBoard = [
        [[1,1,1],[0,0,0],[0,0,0]],
        [[0,0,0],[1,1,1],[0,0,0]],
        [[0,0,0],[0,0,0],[1,1,1]],
        
        [[1,0,0],[1,0,0], [1,0,0]],
        [[0,1,0],[0,1,0], [0,1,0]],
        [[0,0,1],[0,0,1], [0,0,1]],
        
        [[1,0,0],[0,1,0], [0,0,1]],
        [[0,0,1],[0,1,0], [1,0,0]],
    ]
    
    public func checkStatus() -> GameState {
        if checkForWinner(val: 1) { // x
            return .xWin
        } else if checkForWinner(val: 2) { // O
            return .oWin
        } else {
            var xCount = 0, oCount = 0, dotCount = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    switch board[i][j] {
                    case 1: // x
                        xCount += 1
                    case 2: // O
                        oCount += 1
                    default:
                        dotCount += 1
                    }
                }
            }
            
            if dotCount == 0 {
                return .draw
            } else if xCount > oCount {
                return .oTurn
            } else {
                return .xTurn
            }
        }
    }
    
    private func checkForWinner(val: Int) -> Bool {
        var counter = 0
        for wBoard in winningBoard {
            counter = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    if wBoard[i][j] == 1 {
                        if board[i][j] == val {
                            counter += 1
                        }
                    }
                }
            }
            if (counter == 3) {
                return true
            }
        }
        return false
    }
    
}
