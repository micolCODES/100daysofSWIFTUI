//
//  ContentView.swift
//  BetterRest
//
//  Created by Micol on 18.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hour", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("DatePicker 1", selection: $wakeUp, displayedComponents: .hourAndMinute)
            DatePicker("DatePicker 2", selection: $wakeUp, in: Date.now...)
                //.labelsHidden()
        }
        .padding()
    }
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
