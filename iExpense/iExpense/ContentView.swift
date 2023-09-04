//
//  ContentView.swift
//  iExpense
//
//  Created by Micol on 01.09.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    
    var body: some View {
        NavigationView {
            List {
                // using ID from struct in ExpenseItems, which is a self-generated UUID, which is unique for each item
                ForEach(expenses.items/*, id: \.id <- I can remove this since I have marked the struct as "Identifiable" */) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
// -------------- METHODS GO HERE ----------------
    func removeItems(at offsets: IndexSet) {
        // IndexSet tells us a list of items in the list, each with its own number
        // remove(atOffsets: )
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
