//
//  YourNameView.swift
//  XandOs
//
//  Created by Fatakhillah Khaqo on 21/07/24.
//

import SwiftUI

struct YourNameView: View {
    @AppStorage("yourName") var yourName = ""
    @State private var userName = ""
    var body: some View {
        VStack{
            Text("This is the name that will be associated with this device.")
            TextField("Your Name", text: $userName)
                .textFieldStyle(.roundedBorder)
            Button("Set"){
                yourName = userName
            }
            .buttonStyle(.borderedProminent)
            .disabled(userName.isEmpty)
            Image(.launchScreen)
            Spacer()
        }
        .padding()
        .navigationTitle("Xs and Os")
        .inNavigationStack()
    }
}

#Preview {
    YourNameView()
}
