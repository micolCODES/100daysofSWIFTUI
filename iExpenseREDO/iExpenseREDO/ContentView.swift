//
//  ContentView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expense()
    
    @State private var showView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        .sheet(isPresented: $showView){
            AddView(expenses: expenses)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
