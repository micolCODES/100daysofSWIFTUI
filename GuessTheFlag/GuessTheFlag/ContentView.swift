//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Micol Romano on 7/6/23.
//

import SwiftUI

struct FlagImage: View {
    var imageNames: String
    
    var body: some View {
        Image(imageNames)
            .renderingMode(.original)
            //.clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var counter = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "USA"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius:700)
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font((.subheadline.weight(.heavy)))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            
                        } label: {
                            FlagImage(imageNames: countries[number])
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                //.clipShape(Capsule())
//                                .shadow(radius: 5)
                        }
                    }
                    Text(" \(counter) of 8")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
            .alert(scoreTitle, isPresented: $showingScore) {
                if counter != 8 {
                    Button("Continue", action: askQuestion)
                } else {
                    Button("Play again", action: askQuestion)
                }
            } message: {
                if counter != 8 {
                Text("You score is \(score)")
                } else {
                    if score == 8 {
                        Text("You score is \(score) out of 8. WELL DONE YOU!")
                    } else if score > 3 && score < 8 {
                        Text("You score is \(score) out of 8. You're almost a Pro at this.")
                    } else if score < 4 {
                        Text("You score is \(score) out of 8. Better play again, I bet you can do better!")
                    }
                    
                }
            }
    }

    func flagTapped(_ number: Int) {
        if counter < 8 {
            if number == correctAnswer {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong, that's the flag of \(countries[number])"
            }
            counter += 1
            showingScore = true
        } else {
            if number == correctAnswer {
            scoreTitle = "Correct + Game over!"
            score += 1
            } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number]). Game over!"
        }
        showingScore = true
    }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        if counter == 8 {
            score = 0
            counter = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
