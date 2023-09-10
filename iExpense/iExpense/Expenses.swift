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
        if let savedItems = UserDefaults.standard.data(forKey: "Items") { /*If you can read Items in UserDefaults then...*/
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self/*NOTE 2*/, from: savedItems) { /*... then please decoded them here...*/ //... and IF you can decode them, ...
                items = decodedItems /*... then store them into items*/
                return
            }
        }
        // if not, then item is empty
        items = []
    }
}

//NOTE 1: you get an error here if you forget to go to the struct and add the "Codable" protocol. "encoder.encode" only works with struct conforming to the Codable protocol. So basically you'll always get it as you code, and once the class is done, for to struct calling/defining the class and add the "Codable" protocol. The ERROR YOU GET IS -> X) Class 'JSONEncoder' requires that 'ExpenseItem' conform to 'Encodable'

//NOTE 2: this is what I EXPECT to receive from the decoder (basically this is the blueprint of the item that I expect the decoder to make as it decodes, so like telling a ribosome that I expect a protein made up of a chain of single aminoacids from the mRNA copy it is "decoding"). I use .self to explain that I am referring to the array of ExpenseItems by itelf: not a specific array, but that type of array
