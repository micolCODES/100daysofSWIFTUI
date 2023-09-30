//
//  Habits.swift
//  HabitTracking
//
//  Created by Micol on 30.09.23.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [Habit](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(habits){
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits){
                habits = decodedHabits
                return
            }
        }
        habits = []
    }
}
