//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Micol on 30.09.23.
//

import SwiftUI

struct AddHabitView: View {
    @StateObject var habits = Habits()
    
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
            }
            .toolbar {
                Button {
                    let newHabit = Habit(name: name, description: description)
                    habits.habits.append(newHabit)
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
