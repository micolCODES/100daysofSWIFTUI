//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Micol on 07.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create Account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
            //.disabled(username.isEmpty || email.isEmpty)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    ContentView()
}
