//
//  ContentView.swift
//  iExpenseREDO
//
//  Created by Micol on 07.09.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                //ForEach
            }
            .navigationTitle("iExpenseREDO")
        }
        .toolbar {
            Button {
                //add item button
            } label: {
                Text("Add Item")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
