//
//  ContentView.swift
//  WordScramble
//
//  Created by Micol on 19.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)
                    }
                    Section {
                        ForEach(usedWords, id: \.self) {
                            word in
                            HStack{
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(rootWord)
                .toolbar {                    ToolbarItem{
                        Text("Score: \(score)")
                    }
                    ToolbarItem(placement: .bottomBar){
                        Button("New Word", action: startGame)}

                }
                .onSubmit(addNewWord)
                //function plays when view is shown
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text(errorMessage)
                }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original 😉")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'! 😅")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't make up words 😜")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Word is too short", message: "You need a word with al least 3 letters")
            return
        }
        
        guard isStartWord(word: answer) else {
            wordError(title: "Word is the start word", message: "You cannot use your start word as an answer 😏")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        score += newWord.count
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = [String]()
                score = 0
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    
    //check if word has been used or not
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func isLongEnough(word: String) -> Bool {
        let returnBool = word.count > 2 ? true : false
        return returnBool
    }
    
    func isStartWord(word: String) -> Bool {
        let returnBool = word != rootWord ? true : false
        return returnBool
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
