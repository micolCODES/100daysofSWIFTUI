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
    @State private var questionNumber = 1
    @State private var gameStarted = false
    @State private var showGame = false
    
    var multiplierBank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var multiplicationTable = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var questionOptions = [5, 10, 15, 20]
    
    
    var body: some View {
        NavigationView {
            VStack {
                if showGame == false {
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
                    playGame()
                    gameStarted.toggle()
                }
            }
                //This group should only show after you hit "Play Game" button
                VStack {
                    if showGame {
                        
                        Text("Question # \(questionNumber)")
                        
                        Text("What is \(selectedNumber) x \(gameStarted ? questionBank[questionNumber] : questionBank[0])")
                        
                        TextField("Enter your name", value: $typedAnswer, format: .number)
                            .keyboardType(.decimalPad)
                        Button("Check"){
                            check()
                        }
                        Text("Score: \(score)")
                    }
                }
                //alert to end game and play a new one
            }
        }
        .padding()
    }
    
    func playGame(){
        var workingNumber = 0
        questionBank = [0]
        answerBank = [0]
        score = 0
        showGame = true
        for _ in 0..<howManyQuestions {
            workingNumber = multiplierBank[Int.random(in: 0...11)]
            questionBank.append(workingNumber)
            answerBank.append(selectedNumber * workingNumber)
//            print(workingNumber)
        }
        print("******** NEW GAME ********")
        print("Question bank: \(questionBank)")
        print("Answer Bank: \(answerBank)")
    }
    
    func check() {
        if gameStarted == true {
            print("the game has started")
            print(answerBank[questionNumber])
            if typedAnswer == answerBank[questionNumber]{
                score += 1
                if questionNumber == howManyQuestions {
                    questionNumber = 1
                    showGame = false
                    print("*** GAME OVER ***")
                    //should show alert with score and ask to start new game
                } else {
                    questionNumber += 1
                }
                //add text message or answer preview of some kind
            } else {
                if questionNumber == howManyQuestions {
                    questionNumber = 1
                    showGame = false
                    print("*** GAME OVER ***")
                    //should show alert with score and ask to start new game
                } else {
                    questionNumber += 1
                }
            }
        } else {
           // show alert to start game
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
