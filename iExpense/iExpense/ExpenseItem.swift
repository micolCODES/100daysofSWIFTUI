//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Micol on 04.09.23.
//

import Foundation

// Identifyable means it has a unique identifier, in this case, the self-generated UUID. If I use this, I don't need to tell the ForEach loop how to identify the items, since I've marked them as identifiable
//Codable means the class Expenses can encode and save with JSONencoder and UserDefaults

struct ExpenseItem : Identifiable, Codable {
    //now I get alert that id is immutable (if it's set with "LET"). This is ok, but you can change it to "VAR" to  make the alert go away.
    var /*let*/ id = UUID()
    let name: String
    let type: String
    let amount: Double
}
