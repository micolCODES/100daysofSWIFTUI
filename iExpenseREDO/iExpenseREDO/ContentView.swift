//
//  ContentView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("iExpenseREDO")
            .toolbar {
                Button {
                    showAddExpense = true
                } label: {
                    Text("Add Item")
                }
            }
        }
        
        .sheet(isPresented: $showAddExpense) {
            AddView(expense: expenses)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
