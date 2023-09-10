//
//  ContentView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenseREDO")
            .toolbar {
                Button {
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddView){
                AddView(expenses: expenses)
            }
        }
    }
// ---------- METHODS GO HERE ----------
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
