//
//  ExpenseItem.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import Foundation

struct ExpenseItem : Identifiable {
    var id = UUID()
    var name : String
    var type : String
    var amount : Double
}
