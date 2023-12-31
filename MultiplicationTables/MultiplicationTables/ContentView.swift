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
    @State private var userAnswerBank = [0]
    @State private var typedAnswer = 0
    @State private var reviewQuestionBank = [0]
    @State private var reviewAnswerBank = [0]
    @State private var score = 0
    @State private var questionNumber = 1
    @State private var setUpView = true
    @State private var gameView = false
    @State private var gameOverView = false
    @State private var isReview = false
    
    var multiplierBank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var multiplicationTable = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var questionOptions = [5, 10, 15, 20]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                //setup View
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
            }
                //Game View
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
                //Game Over View Score
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
//                            .padding()
                        Text("out of \(howManyQuestions)")
                            .font(.title)
                            .fontWeight(.thin)
                    }
                }
                //Game Over View Answers
                ScrollView{
                    VStack {
                        if gameOverView {
                            Spacer()
                            if isReview {
                                if reviewAnswerBank.count == 1 {
                                    Text("👍")
                                        .font(Font.system(size: 170))
                                } else {
                                    Text("Your missed answers:")
                                        .font(.title2)
                                        .fontWeight(.thin)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 5)
                                }
                            } else {
                                if reviewAnswerBank.count == 1 {
                                    Text("🥳")
                                        .font(Font.system(size: 170))
                                } else {
                                    Text("Your missed answers:")
                                        .font(.title2)
                                        .fontWeight(.thin)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 5)
                                }
                            }
                            ForEach((1...howManyQuestions), id:\.self) {
                                if userAnswerBank[$0] != answerBank[$0] {
                                    Text("\($0)) \(selectedNumber)・\(questionBank[$0]) = \(userAnswerBank[$0]) ❌ \(selectedNumber)・\(questionBank[$0]) = \(answerBank[$0])")
                                        .font(.headline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.red)
                                        .padding(3)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                        }
                    }
                    .padding()
                    .background(reviewAnswerBank.count == 1 ? .white : Color(red: 242/255, green: 244/255, blue: 242/255))
                    .cornerRadius(10)
                }
                .frame(height: gameOverView ? 300 : 0)
                //Game Over View Button
                VStack {
                    if gameOverView {
                        if reviewAnswerBank.count != 1 {
                            Button("Review"){
                                review()
                            }
                            .buttonStyle(PlayGameButton())
                        }
                        Button("Play Again"){
                            playagain()
                        }
                        .buttonStyle(PlayGameButton())
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
        userAnswerBank = [0]
        reviewAnswerBank = [0]
        reviewQuestionBank = [0]
        for _ in 0..<howManyQuestions {
            workingNumber = multiplierBank[Int.random(in: 0...11)]
            questionBank.append(workingNumber)
            answerBank.append(selectedNumber * workingNumber)
        }
        
        setUpView = false
        gameView = true
    }
    
    func check() {
        if gameView == true {
            userAnswerBank.append(typedAnswer)
            //if right answer
            if typedAnswer == answerBank[questionNumber]{
                score += 1
                if questionNumber == howManyQuestions {
                    questionNumber = 1
                    setUpView = false
                    gameView = false
                    gameOverView = true
                    //should show alert with score and ask to start new game
                } else {
                    questionNumber += 1
                }
            //if wrong answer
            } else {
                reviewAnswerBank.append(answerBank[questionNumber])
                reviewQuestionBank.append(answerBank[questionNumber] / selectedNumber)
                if questionNumber == howManyQuestions {
                    questionNumber = 1
                    setUpView = false
                    gameView = false
                    gameOverView = true
                    print("Review Answer Bank: \(reviewAnswerBank)")
                    print("Review Question Bank: \(reviewQuestionBank)")
                } else {
                    questionNumber += 1
                }
            }
        }
        print("Review answer bank count: \(reviewAnswerBank.count)")
    }
    
    func playagain() {
        gameOverView = false
        setUpView = true
        isReview = false
        score = 0
    }
    
    func review() {
        isReview = true
        score = 0
        answerBank = reviewAnswerBank
        questionBank = reviewQuestionBank
        print("New Answer Bank: \(answerBank)")
        print("New Question Bank: \(questionBank)")
        userAnswerBank = [0]
        reviewAnswerBank = [0]
        if reviewQuestionBank.count > 1 {
            reviewQuestionBank = [0]
            howManyQuestions = questionBank.count - 1
            setUpView = false
            gameView = true
            gameOverView = false
        } else {
            reviewQuestionBank = [0]
            setUpView = true
            gameView = false
            gameOverView = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
