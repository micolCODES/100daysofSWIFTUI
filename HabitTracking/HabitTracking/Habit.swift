//
//  Habit.swift
//  HabitTracking
//
//  Created by Micol on 30.09.23.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
}
