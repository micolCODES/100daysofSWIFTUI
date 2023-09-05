//
//  AddView.swift
//  iExpense
//
//  Created by Micol on 04.09.23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView() {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format:.currency(code: Locale.current.currency?.identifier ?? "€"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save")
                {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        // adding expenses: Expenses() to remove error becasue we have an @ObservedObject property
        AddView(expenses: Expenses())
    }
}
