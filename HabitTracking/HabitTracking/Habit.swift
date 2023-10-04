//
//  Habit.swift
//  HabitTracking
//
//  Created by Micol on 30.09.23.
//

import Foundation

struct Habit: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var counter: Int
}
