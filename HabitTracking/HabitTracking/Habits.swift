//
//  Habits.swift
//  HabitTracking
//
//  Created by Micol on 30.09.23.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [Habit](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits){
                items = decodedHabits
                return
            }
        }
        items = []
    }
    
    static let sampleHabit = Habit(name: "Testhabit", description: "This is a test description, and it's long so it will end up on two lines.", counter: 6)
}
