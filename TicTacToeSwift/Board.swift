//
//  Board.swift
//  TicTacToeSwift
//
//  Created by Dhyan Thacker on 2/19/25.
//
import Foundation

struct Board {
    private var squares: [[Square]] = []
    
    init() {
        for _ in 0..<3 {
            var row: [Square] = []
            for _ in 0..<3 {
                row.append(.init())
            }
            squares.append(row)
        }
    }
    
    func printBoard() {
        for i in 0..<3 {
            print(" " + squares[i][0].symbol + " | " + squares[i][1].symbol + " | " + squares[i][2].symbol)
            if i < 2 {
                print("---|---|---")
            }
        }
    }
    
    @discardableResult
    mutating func setSquare(_ square: Int, forPlayer player: String) -> Bool {
        if 4 > square && square > 0 {
            let row = 0
            let col = square - 1
            
            if squares[row][col].symbol == " " {
                squares[row][col].fill(with: player)
                return true
            }
            print("Square is already taken.")
        } else if 7 > square && square > 3 {
            let row = 1
            let col = square - 4
            
            if squares[row][col].symbol == " " {
                squares[row][col].fill(with: player)
                return true
            }
            print("Square is already taken.")
        } else if 10 > square && square > 6 {
            let row = 2
            let col = square - 7
            
            if squares[row][col].symbol == " " {
                squares[row][col].fill(with: player)
                return true
            }
            print("Square is already taken.")
        } else {
            print("Invalid Square.")
        }
        return false
    }
    
    func checkWin() -> Bool {
        for i in 0..<3 {
            // check rows
            if squares[i][0].symbol == squares[i][1].symbol && squares[i][1].symbol == squares[i][2].symbol && squares[i][0].symbol != " " {
                return true
            }
            
            // check columns
            if squares[0][i].symbol == squares[1][i].symbol && squares[1][i].symbol == squares[2][i].symbol && squares[0][i].symbol != " " {
                return true
            }
        }
        
        // check diagonals
        if squares[0][0].symbol == squares[1][1].symbol && squares[1][1].symbol == squares[2][2].symbol && squares[1][1].symbol != " " {
            return true
        }
        if squares[2][0].symbol == squares[1][1].symbol && squares[1][1].symbol == squares[0][2].symbol && squares[1][1].symbol != " " {
            return true
        }
        
        return false
    }
    
    // call only AFTER checkWin
    func checkTie() -> Bool {
        for row in squares {
            for square in row {
                if square.symbol == " " {
                    return false
                }
            }
        }
        
        return true
    }
    
    mutating func reset() {
        for i in 0..<3 {
            for j in 0..<3 {
                squares[i][j].clear()
            }
        }
    }
}
