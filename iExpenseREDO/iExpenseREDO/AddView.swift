//
//  AddView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expense: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var typeArray = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of Expense", text:$name )
                Picker("Type", selection: $type) {
                    ForEach(typeArray, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
            }
            .navigationTitle("Add your Expense")
            .toolbar {
                Button("Save") {
                    let newItem = ExpenseItem(name: name, type: type, amount: amount)
                    expense.items.append(newItem)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expenses())
    }
}
