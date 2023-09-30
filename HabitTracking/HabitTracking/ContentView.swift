//
//  ContentView.swift
//  HabitTracking
//
//  Created by Micol on 01.09.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listOfHabits = Habits()
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(listOfHabits.habits){
                    habit in
                    HStack {
                        VStack(alignment: .leading){
                            Text(habit.name)
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            //count number of times it was done
                            Text("###")
                        }
                    }
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented:$showAddSheet){
                HabitInfoView(habits: listOfHabits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
