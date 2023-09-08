//
//  Expense.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import Foundation

class Expense : ObservableObject {
    @Published var items = [ExpenseItem]()
}
