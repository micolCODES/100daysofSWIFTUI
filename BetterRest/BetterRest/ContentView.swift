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
    @State private var timeToSleep = Date.now
    
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
                Section{
                    Text("When do you want to wake up?")
//                        .font(.headline)
                        .listRowSeparator(.hidden)
                    DatePicker("Enter wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section{
                    Text("How much sleep do you want?")
                        .listRowSeparator(.hidden)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section{
                    Picker("How much coffee do you drink?", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self){
                            Text("\($0)")
                        }
                    }
//                    Text("How much coffee do you drink?")
//                        .listRowSeparator(.hidden)
//                    Stepper(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
                Section {
                    Text("You need to go to sleep at")
                        .listRowSeparator(.hidden)
                    Text("\(timeToSleep.formatted(date: .omitted, time: .shortened))")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("BetterRest")
//            .toolbar{
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert){
//                Button("OK") {}
//            } message: {
//                Text(alertMessage)
//            }
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
            
            timeToSleep = wakeUp - prediction.actualSleep
            
//            let sleepTime = wakeUp - prediction.actualSleep
//            alertTitle = "You ideal bedtime is "
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
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
