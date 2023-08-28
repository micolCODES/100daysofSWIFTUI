//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Micol on 27.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedNumber = 2
    @State private var howManyQuestions = 5
    
    var multiplicationTable = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var questionOptions = [5, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                //select which multiplication tables you want
                Text("Pick a multiplication table")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("Multiplication table", selection: $selectedNumber){
                    ForEach(multiplicationTable, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                //select how many question you want
                Text("Pick how many questions you want")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("Pick how many questions you want", selection: $howManyQuestions){
                    ForEach(questionOptions, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                //show questions
                Text("Start the game")
                //show score
                
                //alert to end game and play a new one
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
