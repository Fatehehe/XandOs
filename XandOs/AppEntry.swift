//
//  XandOsApp.swift
//  XandOs
//
//  Created by Fatakhillah Khaqo on 20/07/24.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
