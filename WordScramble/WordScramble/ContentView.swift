//
//  ContentView.swift
//  WordScramble
//
//  Created by Micol on 19.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt"){
            //this works if file was found
            if let fileContents = try? String(contentsOf: fileURL){
                //loads file into a String
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
