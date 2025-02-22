//
//  AI.swift
//  TicTacToeSwift
//
//  Created by Dhyan Thacker on 2/19/25.
//
import Foundation

// turn in terms of o, then x
struct AI {
    var previousMoves: [Int] = []
    
    mutating func selectSquare(lastMove: Int = -1, board: Board, turn: Int) -> Int {
        if lastMove == -1 {
            previousMoves.append(1)
            return 1
        }
        previousMoves.append(lastMove)
        switch lastMove {
        case 2:
            return moveIs2(turn: turn)
        case 3:
            return moveIs3(turn: turn)
        case 4:
            return moveIs4(turn: turn)
        case 5:
            return moveIs5(turn: turn)
        case 6:
            return moveIs6(turn: turn)
        case 7:
            return moveIs7(turn: turn)
        case 8:
            return moveIs8(turn: turn)
        case 9:
            return moveIs9(turn: turn)
        default:
            return 0
        }
    }
    
    private mutating func moveIs2(turn: Int) -> Int {
        if turn == 1 {
            return 5
        } else if turn == 2 {
            switch previousMoves[1] {
            case 3:
                return 4
            case 5:
                return 8
            case 4, 6, 7, 8:
                return 9
            case 9:
                return 7
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 3:
                // only one possibility
                return 8
            case 4:
                return 7
            case 5:
                switch previousMoves[2] {
                case 3:
                    return 4
                case 4, 7:
                    return 6
                case 6:
                    return 7
                default:
                    return 0
                }
            case 6:
                return 7
            case 8:
                return 4
            default:
                return 0
            }
        } else if turn == 4 {
            // guarenteed previousMoves[1] is 5
            if previousMoves[2] == 4 {
                // third move is 3
                return 8
            } else if previousMoves[2] == 6 {
                // third move is 7
                return 8
            }
        }
        return 0
    }
    private mutating func moveIs3(turn: Int) -> Int {
        if turn == 1 {
            return 7
        } else if turn == 2 {
            switch previousMoves[1] {
            case 2, 4, 6, 7:
                return 9
            case 5:
                return 7
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 2:
                return 4
            case 5:
                switch previousMoves[2] {
                case 2:
                    return 8
                case 4, 6, 8:
                    return 7
                default:
                    return 0
                }
            case 8:
                return 4
            default:
                return 0
            }
        }
        return 0
    }
    private mutating func moveIs4(turn: Int) -> Int {
        if turn == 1 {
            return 5
        } else if turn == 2 {
            switch previousMoves[1] {
            case 2, 3, 6, 8:
                return 9
            case 5:
                return 6
            case 7, 9:
                return 2
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 2, 8:
                return 3
            case 5:
                switch previousMoves[2] {
                case 2, 3:
                    return 8
                case 7:
                    return 2
                case 8:
                    return 3
                default:
                    return 0
                }
            case 7:
                return 6
            case 9:
                return 5
            default:
                return 0
            }
        } else if turn == 4 {
            return 6
        }
        return 0
    }
    private mutating func moveIs5(turn: Int) -> Int {
        if turn == 1 {
            return 9
        } else if turn == 2 {
            switch previousMoves[1] {
            case 3:
                return 4
            case 6:
                return 9
            case 7, 9:
                return 2
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 3:
                return 8
            case 7:
                return 6
            case 9:
                return 4
            default:
                return 0
            }
        }
        return 0
    }
    private mutating func moveIs6(turn: Int) -> Int {
        if turn == 1 {
            return 5
        } else if turn == 2 {
            switch previousMoves[1] {
            case 2, 4, 8:
                return 9
            case 3, 5:
                return 4
            case 7, 9:
                return 2
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 2, 8, 9:
                return 4
            case 3:
                return 8
            case 4:
                return 2
            case 5:
                switch previousMoves[2] {
                case 2, 3:
                    return 8
                case 7:
                    return 2
                case 8:
                    return 3
                default:
                    return 0
                }
            case 7:
                return 5
            default:
                return 0
            }
        } else if turn == 4 {
            return 4
        }
        return 0
    }
    private mutating func moveIs7(turn: Int) -> Int {
        if turn == 1 {
            return 3
        } else if turn == 2 {
            switch previousMoves[1] {
            case 2, 4, 6, 8:
                return 9
            case 5:
                return 3
            case 9:
                return 2
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 4:
                return 2
            case 5:
                switch previousMoves[2] {
                case 2, 6, 8:
                    return 3
                case 4:
                    return 6
                default:
                    return 0
                }
            case 6:
                return 2
            default:
                return 0
            }
        }
        return 0
    }
    private mutating func moveIs8(turn: Int) -> Int {
        if turn == 1 {
            return 5
        } else if turn == 2 {
            switch previousMoves[1] {
            case 2, 4, 6:
                return 9
            case 3:
                return 4
            case 5, 7, 9:
                return 2
            default:
                return 0
            }
        } else if turn == 3 {
            switch previousMoves[1] {
            case 2, 9:
                return 4
            case 3:
                return 5
            case 4, 6:
                return 2
            case 5:
                switch previousMoves[2] {
                case 3:
                    return 4
                case 4, 7:
                    return 6
                case 6:
                    return 7
                default:
                    return 0
                }
            case 7:
                return 6
            default:
                return 0
            }
        } else if turn == 4 {
            return 2
        }
        return 0
    }
    private mutating func moveIs9(turn: Int) -> Int {
        if turn == 1 {
            return 3
        } else if turn == 2 {
            switch previousMoves[1] {
            case 2, 8:
                return 7
            case 3:
                return 4
            case 4, 6:
                return 3
            case 7:
                return 2
            default:
                return 0
            }
        }
        return 0
    }
    mutating func reset() {
        previousMoves = []
    }
}
