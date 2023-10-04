//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Micol on 30.09.23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var listOfHabits = Habits()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    
    var body: some View {
        NavigationStack {
            Form {
                //name
                TextField("Name of Habit", text: $name)
                //description
                TextField("Description", text: $description, axis: .vertical)
                //EXTEND icon and/or color
            }
            .toolbar {
                Button {
                    let newHabit = Habit(name: name, description: description, counter: 0)
                    listOfHabits.items.append(newHabit)
                    dismiss()
                } label: {
                    Text("Add Habit")
                }
            }
        }
    }
}

#Preview {
    AddHabitView()
}
