//
//  DataController.swift
//  Bookworm
//
//  Created by Micol on 16.10.23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm") // not loaded yet, it's just being prepared to load it
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
