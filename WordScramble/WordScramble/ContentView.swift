//
//  ContentView.swift
//  WordScramble
//
//  Created by Micol on 19.08.23.
//

import SwiftUI

struct ContentView: View {
    let people = ["John", "Jack", "Jill"]
    var body: some View {
        List(people, id: \.self){
            Text($0)
        }
//        List(0..<5){
//            Text("Dynamic Item #\($0)")
//        }
//        List {
//            Section("Section 1"){
//                Text("Item #1")
//                ForEach(0..<5) {
//                    Text("Dynamic Item \($0)")
//                }
//            }
//            Section("Section 2") {
//                Text("Item #2")
//                Text("Item #3")
//            }
//        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
