//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Micol on 14.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                //Title
                Text("Rock Paper Scissors")
                    .font(.title.weight(.thin))
                    .padding()
                //Hstack game with Rock/Paper/Scissor + Win/Lose
                HStack{
                    Text("🪨 / 📄 / ✂️")
                    Text("Win/Lose")
                }
                .padding()
                //VStack user with 3 buttoms for options
                VStack{
                    Button("🪨") {
                        //some action
                    }
                    Button("📄") {
                        //some action
                    }
                    Button("✂️") {
                        //some action
                    }
                }
                .padding()
                // VStack with score count
                VStack {
                    Text("Score")
                    Text("0 / 10")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
