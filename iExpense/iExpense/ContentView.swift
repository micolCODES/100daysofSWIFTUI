//
//  ContentView.swift
//  iExpense
//
//  Created by Micol on 01.09.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                // using ID from struct in ExpenseItems, which is a self-generated UUID, which is unique for each item. id: \.id <- I can remove this since I have marked the struct as "Identifiable"
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "€"))
                                .foregroundColor( item.amount > 5 ? .black : .gray)
                                .fontWeight(item.amount < 100 ? .medium : .bold)
                        }
                    }
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                     
                    /*remove previous code and add a "show view" to show the view I created
                     let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                     expenses.items.append(expense)*/
                    
                    showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExpense) {
                //put what you want to show here
                AddView(expenses: expenses)
                 
            }
        }
    }
// -------------- METHODS GO HERE ----------------
    func removeItems(at offsets: IndexSet) {
        // IndexSet tells us a list of items in the list, each with its own number
        // remove(atOffsets: )
        expenses.items.remove(atOffsets: offsets)
    }
// -------------- METHODS END HERE ----------------
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
