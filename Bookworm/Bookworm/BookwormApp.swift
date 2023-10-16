//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Micol on 08.10.23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) //"managedObjectContext" is the live version of my data
        }
    }
}
