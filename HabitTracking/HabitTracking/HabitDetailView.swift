//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by Micol on 01.10.23.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    
    var body: some View {
        ZStack{
            VStack {
                //EXTEND icon
                Text(habit.name)
                Text(habit.description)
                //Text(habit.counter)
                HStack {
                    Button {
                        //increase count
                    } label: {
                        Image(systemName: "plus")
                    }
                    HStack {
                        Button {
                            // decrease count
                        } label: {
                            Image(systemName: "minus")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HabitDetailView(habit: Habits.sampleHabit)
}
