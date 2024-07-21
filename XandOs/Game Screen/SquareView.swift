//
//  ScoreView.swift
//  XandOs
//
//  Created by Fatakhillah Khaqo on 21/07/24.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var game: GameService
    let index: Int
    var body: some View {
        Button{
            game.makeMove(at: index)
        }label: {
            game.gameBoard[index].image
                .resizable()
                .frame(width: 100, height: 100)
        }
        .disabled(game.gameBoard[index].player != nil)
        .foregroundColor(.primary)
    }
}

#Preview {
    SquareView(index: 1)
        .environmentObject(GameService())
}
