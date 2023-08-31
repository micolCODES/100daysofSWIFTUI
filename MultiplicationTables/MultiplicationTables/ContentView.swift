//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Micol on 27.08.23.
//

import SwiftUI

struct PlayGameButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 125/255, green: 152/255, blue: 131/255))
            .foregroundStyle(.white)
            .font(.system(size: 30, weight: Font.Weight.semibold))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ContentView: View {
    @State private var selectedNumber = 2
    @State private var howManyQuestions = 5
    @State private var questionBank = [0]
    @State private var answerBank = [0]
    @State private var typedAnswer = 0
    @State private var score = 0
    @State private var questionNumber = 1
    @State private var setUpView = true
    @State private var gameView = false
    @State private var gameOverView = false
    
    var multiplierBank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var multiplicationTable = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var questionOptions = [1, 5, 10, 15, 20]
    
    
    var body: some View {
        NavigationView {
            VStack {
                if setUpView {
                //select which multiplication tables you want
                Spacer()
                Text("Pick a multiplication table")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.thin)
                Picker("Multiplication table", selection: $selectedNumber){
                    ForEach(multiplicationTable, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
                //select how many question you want
                Text("Pick how many questions you want")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.thin)
                Picker("Pick how many questions you want", selection: $howManyQuestions){
                    ForEach(questionOptions, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                Button {
                    playGame()
                } label: {
                    Text("Play Game")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlayGameButton())
                Spacer()
            }
                //This group should only show after you hit "Play Game" button
                VStack {
                    if gameView {
                        
                        Text("Question # \(questionNumber)")
                            .font(.title)
                            .fontWeight(.thin)
                        Spacer()
                        Text("\(selectedNumber) x \(gameView ? questionBank[questionNumber] : questionBank[0])")
                            .font(Font.system(size: 50))
                            .foregroundColor((Color(red: 98/255, green: 123/255, blue: 87/255)))
                        Spacer()
                        TextField("...", value: $typedAnswer, format: .number)
                            .keyboardType(.decimalPad)
                            .font(Font.system(size: 100))
                            .multilineTextAlignment(.center)
                        Spacer()
                        Button("Check"){
                            check()
                        }
                        .buttonStyle(PlayGameButton())
                        
                        Spacer()
                        Text("Score: \(score)")
                            .font(.title)
                            .fontWeight(.thin)
                    }
                }
                //alert to end game and play a new one
                VStack {
                    if gameOverView {
                        Spacer()
                        Text("Game Over!")
                            .font(.title)
                            .fontWeight(.medium)
                        Spacer()
                        Text("Your score is")
                            .font(.title)
                            .fontWeight(.thin)
                        Text("\(score)")
                            .font(Font.system(size: 100))
                            .foregroundColor((Color(red: 98/255, green: 123/255, blue: 87/255)))
                            .padding()
                        Text("out of \(howManyQuestions)")
                            .font(.title)
                            .fontWeight(.thin)
                        Spacer()
                        Button("Play Again"){
                            playagain()
                        }
                        .buttonStyle(PlayGameButton())
                        Spacer()
                    }
                }
            }
        }
        .padding()
    }
    
    func playGame(){
        var workingNumber = 0
        questionBank = [0]
        answerBank = [0]
//        score = 0
        for _ in 0..<howManyQuestions {
            workingNumber = multiplierBank[Int.random(in: 0...11)]
            questionBank.append(workingNumber)
            answerBank.append(selectedNumber * workingNumber)
//            print(workingNumber)
        }
//        print("******** NEW GAME ********")
//        print("Question bank: \(questionBank)")
//        print("Answer Bank: \(answerBank)")
        
        setUpView = false
        gameView = true
    }
    
    func check() {
        if gameView == true {
            print("the game has started")
            print(answerBank[questionNumber])
            if typedAnswer == answerBank[questionNumber]{
                score += 1
                if questionNumber == howManyQuestions {
                    questionNumber = 1
                    setUpView = false
                    gameView = false
                    gameOverView = true
                    print("*** GAME OVER ***")
                    //should show alert with score and ask to start new game
                } else {
                    questionNumber += 1
                }
                //add text message or answer preview of some kind
            } else {
                if questionNumber == howManyQuestions {
                    questionNumber = 1
                    setUpView = false
                    gameView = false
                    gameOverView = true
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
    
    func playagain() {
        gameOverView = false
        setUpView = true
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
