//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by Micol on 01.10.23.
//

import SwiftUI

struct HabitDetailView: View {
    //here I am just passing my array of Habits in, since it's @ObservableObject I don't need to make a new one, just observe the one I created in the View with @StateObject
    @ObservedObject var listOfHabits: Habits
    @State var habit: Habit
    
    var body: some View {
        ZStack{
            VStack {
                //EXTEND icon
                Text(habit.name)
                Text(habit.description)
                HStack {
                    Button {
                        var tempHabit = habit
                        tempHabit.counter += 1
                        //in this view, liftofHabits is actually underfined, so it is being handled as an optional and needs the if let
                        if let index = listOfHabits.items.firstIndex(of: habit) {
                            listOfHabits.items[index] = tempHabit
                        }
                        habit = tempHabit
                    } label: {
                        Image(systemName: "plus")
                    }
                    Text("\(habit.counter)")
                    Button {
                        var tempHabit = habit
                        tempHabit.counter -= 1
                        //in this view, liftofHabits is actually underfined, so it is being handled as an optional and needs the if let
                        if let index = listOfHabits.items.firstIndex(of: habit) {
                            listOfHabits.items[index] = tempHabit
                        }
                        habit = tempHabit
                    } label: {
                        Image(systemName: "minus")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    HabitDetailView(listOfHabits: Habits(), habit: Habits.sampleHabit)
}
