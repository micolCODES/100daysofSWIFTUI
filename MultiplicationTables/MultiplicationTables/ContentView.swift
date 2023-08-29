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
    @State private var questionBank = [0]
    @State private var answerBank = [0]
    @State private var typedAnswer = 0
    @State private var score = 0
    @State private var workingNumber = 0
    @State private var questionNumber = 1
    
    var multiplierBank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
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
                Button("PlayGame"){
                    //do something
                    makeQuestions()
                }
                //This group should only show after you hit "Play Game" button
                VStack {
                    VStack {
                        Text("Question # \(questionNumber)")
                    }
                    VStack {
                        Text("What is \(selectedNumber) x \(questionBank[0])")
                    }
                    VStack {
                        TextField("Enter your name", value: $typedAnswer, format: .number)
                            .keyboardType(.decimalPad)
                    }
                    Button("Check"){
                       check()
                    }
                }
                //show score
                VStack {
                    Text("Score: \(score)")
                }
                //alert to end game and play a new one
            }
        }
        .padding()
    }
    
    func makeQuestions(){
        workingNumber = 0
        questionBank = [0]
        answerBank = [0]
        for _ in 0..<howManyQuestions {
            workingNumber = multiplierBank[Int.random(in: 0...11)]
            questionBank.append(workingNumber)
            answerBank.append(selectedNumber * workingNumber)
            print(workingNumber)
        }
        print(questionBank)
        print(answerBank)
    }
    
    func check() {
        if typedAnswer == questionBank[questionNumber]{
            score += 1
            if questionNumber == howManyQuestions {
                questionNumber = 1
            } else {
                questionNumber += 1
            }
            //add text message or answer preview of some kind
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
