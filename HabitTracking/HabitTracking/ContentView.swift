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
                ForEach(listOfHabits.items){
                    item in
                    NavigationLink {
                        HabitDetailView(habit: item)
                    } label: {
                        HStack {
                            VStack(alignment: .leading){
                                Text(item.name)
                            }
                            Spacer()
                            VStack(alignment: .trailing){
                                //Text(item.counter)
                            }
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
                AddHabitView(listOfHabits: listOfHabits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
