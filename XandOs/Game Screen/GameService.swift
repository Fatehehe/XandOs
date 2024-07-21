//
//  GameService.swift
//  XandOs
//
//  Created by Fatakhillah Khaqo on 21/07/24.
//

import SwiftUI

@MainActor
class GameService: ObservableObject{
    @Published var player1 = Player(gamePiece: .x, name: "Player1")
    @Published var player2 = Player(gamePiece: .o, name: "Player2")
    @Published var possibleMoves = Move.all
    @Published var gameOver = false
    @Published var gameBoard = GameSquare.reset
    
    var gameType = GameType.single
    
    var currentPlayer: Player {
        if player1.isCurrent {
            return player1
        }else{
            return player2
        }
    }
    
    var gameStarted: Bool {
        player1.isCurrent || player2.isCurrent
    }
    
    var boardDisabled: Bool {
        gameOver || !gameStarted
    }
    
    func setupGame(gameType: GameType, player1Name: String, player2Name: String){
        switch gameType {
        case .single:
            self.gameType = .single
            player2.name = player2Name
        case .bot:
            self.gameType = .bot
        case .peer:
            self.gameType = .peer
        case .undetermined:
            break
        }
        
        player1.name = player1Name
    }
    
    func reset(){
        player1.isCurrent = false
        player2.isCurrent = false
//        movesTaken.remo
        player1.moves.removeAll()
        player2.moves.removeAll()
        gameOver = false
        possibleMoves = Move.all
        gameBoard = GameSquare.reset
    }
    
    func updateMoves(index: Int){
        if player1.isCurrent{
            player1.moves.append(index + 1)
            gameBoard[index].player = player1
        }else{
            player2.moves.append(index + 1)
            gameBoard[index].player = player2
        }
    }
    
    func checkIfWinner(){
        if player1.isWinner || player2.isWinner{
            gameOver = true
        }
    }
    
    func toggleCurrnet(){
        player1.isCurrent.toggle()
        player2.isCurrent.toggle()
    }
    
    func makeMove(at index: Int){
        if gameBoard[index].player == nil {
            withAnimation{
                updateMoves(index: index)
            }
            checkIfWinner()
            if !gameOver {
                if let matchingIndex = possibleMoves.firstIndex(where: {$0 == (index+1)}){
                    possibleMoves.remove(at: matchingIndex)
                }
                toggleCurrnet()
            }
            if possibleMoves.isEmpty{
                gameOver = true
            }
        }
    }
}
