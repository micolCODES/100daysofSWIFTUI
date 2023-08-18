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
            
            
//            Text(Date.now, format: .dateTime.hour().minute())
//            Text(Date.now, format: .dateTime.day().month().year())
//            Text(Date.now.formatted(date: .long, time: .shortened))
//            Stepper("\(sleepAmount.formatted()) hour", value: $sleepAmount, in: 4...12, step: 0.25)
//            DatePicker("DatePicker 1", selection: $wakeUp, displayedComponents: .hourAndMinute)
//            DatePicker("DatePicker 2", selection: $wakeUp, in: Date.now...)
                //.labelsHidden()
        }
        .padding()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
