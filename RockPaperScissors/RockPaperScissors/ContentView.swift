//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Micol on 14.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var winLose = false
    @State private var answerTitle = ""
    @State private var answerMessage = ""
    @State private var score = 0
    @State private var correctAnswer = 0
    @State private var repCount  = 0

    
    
    var rockPaperScissorsArray = ["🪨", "📄", "✂️"]
    
    //var winningChoices = ["📄", "✂️", "🪨"]
    
    func playTheGame() {
        correctAnswer = Int.random(in: 0...2)
        winLose.toggle()
        if repCount == 10 {
            repCount = 0
            score = 0
        }
    }

    func answerTapped(_ buttonTapped: String) {
        //set condition if you need to win or lose
        //if you need to won over the CPU
        repCount += 1
        if winLose == true {
            //if the correct answer is ROCK, these are the options
            if correctAnswer == 0 {
                if buttonTapped == "scissors" {
                    //win
                    answerTitle = "Yes!!! You win"
                    score += 1
                } else if buttonTapped == "paper" {
                    //lose
                    answerTitle = "Lose"
                    score -= 1
                } else {
                    //draw and redo
                    answerTitle = "Draw... Try again!"
                    repCount -= 1
                }
            }
            //if the correct answer is PAPER, these are the options
            else if correctAnswer == 1 {
                if buttonTapped == "rock" {
                    //win
                    answerTitle = "Yes!!! You win"
                    score += 1
                } else if buttonTapped == "scissors" {
                    //lose
                    answerTitle = "Lose"
                    score -= 1
                } else {
                    //draw and redo
                    answerTitle = "Draw... Try again!"
                    repCount -= 1
                }
            }
            //if the correct answer is SCISSORS, these are the options
            else {
                if buttonTapped == "paper" {
                    //win
                    answerTitle = "Yes!!! You win"
                    score += 1
                } else if buttonTapped == "rock" {
                    //lose
                    answerTitle = "Lose"
                    score -= 1
                } else {
                    //draw and redo
                    answerTitle = "Draw... Try again!"
                    repCount -= 1
                }
                
            }
        }
        //if you need to lose against the CPU
        else {
            //if the correct answer is ROCK, these are the options
            if correctAnswer == 0 {
                if buttonTapped == "paper" {
                    //win
                    answerTitle = "Yes!!! You win"
                    score += 1
                } else if buttonTapped == "scissors" {
                    //lose
                    answerTitle = "Lose"
                    score -= 1
                } else {
                    //draw and redo
                    answerTitle = "Draw... Try again!"
                    repCount -= 1
                }
            }
            //if the correct answer is PAPER, these are the options
            else if correctAnswer == 1 {
                if buttonTapped == "scissors" {
                    //win
                    answerTitle = "Yes!!! You win"
                    score += 1
                } else if buttonTapped == "rock" {
                    //lose
                    answerTitle = "Lose"
                    score -= 1
                } else {
                    //draw and redo
                    answerTitle = "Draw... Try again!"
                    repCount -= 1
                }
            }
            //if the correct answer is SCISSORS, these are the options
            else {
                if buttonTapped == "rock" {
                    //win
                    answerTitle = "Yes!!! You win"
                    score += 1
                } else if buttonTapped == "paper" {
                    //lose
                    answerTitle = "Lose"
                    score -= 1
                } else {
                    //draw and redo
                    answerTitle = "Draw... Try again!"
                    repCount -= 1
                }
                
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                //Title
                Text("Rock Paper Scissors")
                    .font(.title.weight(.thin))
                Spacer()
                //Hstack game with Rock/Paper/Scissor + Win/Lose
                HStack{
                    Text("\(rockPaperScissorsArray[correctAnswer])")
                    Text(" should ")
                    Text("\(winLose ? "Win" : "Lose")")
                }
                Spacer()
                //VStack user with 3 buttoms for options
                VStack{
                    Button("🪨") {
                        //some action
                        showAlert = true
                        answerTapped("rock")
                    }
                    Button("📄") {
                        //some action
                        showAlert = true
                        answerTapped("paper")
                    }
                    Button("✂️") {
                        //some action
                        showAlert = true
                        answerTapped("scissors")
                    }
                }
                Spacer()
                // VStack with score count
                VStack {
                    Text("Score")
                    Text("\(score)")
                    Text("\(repCount) out of 10")
                }
                Spacer()
            }
        }
        .alert(answerTitle, isPresented: $showAlert){
         Button("Continue", action: playTheGame)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
