//
//  ContentView.swift
//  BetterRest
//
//  Created by Micol on 18.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Enter wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("How much sleep do you want?")
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                Text("How much coffee do you drink?")
                Stepper(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
            }
            .navigationTitle("BetterRest")
            .toolbar{
                //Button("Calculate")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
