//
//  XandOsApp.swift
//  XandOs
//
//  Created by Fatakhillah Khaqo on 20/07/24.
//

import SwiftUI

@main
struct AppEntry: App {
    @AppStorage("yourName") var yourName = ""
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            if yourName.isEmpty{
                YourNameView()
            }else{
                StartView(yourName: yourName)
                    .environmentObject(game)
            }
        }
    }
}
