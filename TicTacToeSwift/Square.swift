//
//  Square.swift
//  TicTacToeSwift
//
//  Created by Dhyan Thacker on 2/19/25.
//
import Foundation

struct Square {
    var isFilled = false
    var symbol = " "
    
    mutating func fill(with symbol: String) {
        self.isFilled = true
        self.symbol = symbol
    }
    
    mutating func clear() {
        self.isFilled = false
        self.symbol = " "
    }
}
