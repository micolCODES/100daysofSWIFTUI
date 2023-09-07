//
//  ExpenseItem.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
