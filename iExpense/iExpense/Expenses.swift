//
//  Expenses.swift
//  iExpense
//
//  Created by Micol on 04.09.23.
//

import Foundation

class Expenses : ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? /* NOTE 1 for error here*/encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    //Code will save the data but it will not recall it/load it when the app is reloaded -> you need to add an initializer function here
    init() {
        //If you can read Items in UserDefaults then...
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            //... then please decoded them here, and IF you can decode them, then ...
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self/*this is what I EXPECT to receive. I use .self to explain that I am referring to the array of ExpenseItems by itelf: not a specific array, but that idea of an array*/, from: savedItems) {
                // ... then store them into items
                items = decodedItems
                return
            }
        }
        // if not, then item is empty
        items = []
    }
}

//NOTE 1: you get an error here if you forget to go to the class and add the "Codable" protocol. So basically you'll always get it as you code, and once the class is done, for to struct calling/defining the class and add the "Codable" protocol
