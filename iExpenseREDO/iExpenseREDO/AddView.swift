//
//  AddView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses = Expenses()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    var types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of expense", text: $name)
                Picker("Type of expense", selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
            }
            .toolbar {
                Button {
                    let newItem = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(newItem)
                    dismiss()
                } label: {
                    Text("Add Item")
                }
            }
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
