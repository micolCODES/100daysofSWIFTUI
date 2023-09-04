//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Micol on 04.09.23.
//

import Foundation

// Identifyable means it has a unique identifier, in this case, the self-generated UUID. If I use this, I don't need to tell the ForEach loop how to identify the items, since I've marked them as identifiable

struct ExpenseItem : Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
