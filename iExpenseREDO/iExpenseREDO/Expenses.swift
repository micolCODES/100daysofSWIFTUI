//
//  Expense.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import Foundation

class Expenses : ObservableObject {
    @Published var items = [ExpenseItem]()
}
