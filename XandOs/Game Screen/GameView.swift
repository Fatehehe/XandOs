//
//  GameView.swift
//  XandOs
//
//  Created by Fatakhillah Khaqo on 20/07/24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("End Game"){
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Xs and Os")
        .inNavigationStack()
    }
}

#Preview {
    GameView()
}
