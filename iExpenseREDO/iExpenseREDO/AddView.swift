//
//  AddView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expense
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var types = ["Personal", "Business"]
    var body: some View {
        NavigationView{
            Form{
                TextField("Name of Expense", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
            }
            .toolbar {
                Button("Add Item") {
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
        AddView(expenses: Expense())
    }
}
