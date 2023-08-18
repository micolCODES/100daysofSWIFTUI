//
//  ContentView.swift
//  BetterRest
//
//  Created by Micol on 18.08.23.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime : Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Enter wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("How much sleep do you want?")
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("How much coffee do you drink?")
                    Stepper(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
        
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            //more code goes here
            alertTitle = "You ideal bedtime is "
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            //Something went wrong
            alertTitle = "Error"
            alertMessage = "There was a problem"
            
        }
        showingAlert = true
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
