//
//  main.swift
//  TicTacToeSwift
//
//  Created by Dhyan Thacker on 2/19/25.
//

import Foundation
import ArgumentParser

@main
struct TicTacToeSwift: ParsableCommand {
    @Option(help: "One or two players")
    var players: Int = 2
    
    mutating func run() throws {
        print("Welcome to Tic Tac Toe! Press enter to begin.")
        _ = readLine()
        var currentPlayer = "X"
        var gameWon = false
        var isTie = false
        print(shell("clear"))
        var board = Board()
        board.printBoard()
        if players == 2 {
            while !gameWon && !isTie {
                print("Player \(currentPlayer)'s turn.")
                print("Type the square number you would like to place your symbol on: (type r to restart)")
                let square = readLine()!
                if square == "r" {
                    print(shell("clear"))
                    board.reset()
                    board.printBoard()
                    continue
                }
                let squareInt = Int(square)!
                let success = board.setSquare(squareInt, forPlayer: currentPlayer)
                if !success {
                    print(shell("clear"))
                    board.printBoard()
                    // do this for error display after clear
                    board.setSquare(squareInt, forPlayer: currentPlayer)
                    continue
                }
                print(shell("clear"))
                board.printBoard()
                if board.checkWin() {
                    gameWon = true
                    print("Player \(currentPlayer) wins!")
                } else if board.checkTie() {
                    isTie = true
                    print("It's a tie!")
                }
                currentPlayer = currentPlayer == "X" ? "O" : "X"
            }
        } else {
            var ai = AI()
            var turn = 0
            var lastMove = -1
            while !gameWon && !isTie {
                if currentPlayer == "X" {
                    let move = ai.selectSquare(lastMove: lastMove, board: board, turn: turn)
                    let success = board.setSquare(move, forPlayer: currentPlayer)
                    if !success {
                        print("ai error")
                        return
                    }
                    print(shell("clear"))
                    board.printBoard()
                    if board.checkWin() {
                        gameWon = true
                        print("Player \(currentPlayer) wins!")
                    } else if board.checkTie() {
                        isTie = true
                        print("It's a tie!")
                    }
                    currentPlayer = currentPlayer == "X" ? "O" : "X"
                } else {
                    print("Your turn.")
                    print("Type the square number you would like to place your symbol on: (type r to restart)")
                    let square = readLine()!
                    if square == "r" {
                        print(shell("clear"))
                        currentPlayer = "X"
                        ai.reset()
                        turn = 0
                        lastMove = -1
                        board.reset()
                        board.printBoard()
                        continue
                    }
                    let squareInt = Int(square)!
                    let success = board.setSquare(squareInt, forPlayer: currentPlayer)
                    if !success {
                        print(shell("clear"))
                        board.printBoard()
                        // do this for error display after clear
                        board.setSquare(squareInt, forPlayer: currentPlayer)
                        continue
                    }
                    lastMove = squareInt
                    turn += 1
                    print(shell("clear"))
                    board.printBoard()
                    if board.checkWin() {
                        gameWon = true
                        print("Player \(currentPlayer) wins!")
                    } else if board.checkTie() {
                        isTie = true
                        print("It's a tie!")
                    }
                    currentPlayer = currentPlayer == "X" ? "O" : "X"
                }
            }
        }
        print("Thanks for playing!")
    }
    
    @discardableResult
    func shell(_ command: String) -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        task.standardInput = nil
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
}
