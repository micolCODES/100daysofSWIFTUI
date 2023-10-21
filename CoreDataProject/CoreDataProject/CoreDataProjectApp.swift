//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Micol on 21.10.23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) //"managedObjectContext" is the live version of my data
        }
    }
}
