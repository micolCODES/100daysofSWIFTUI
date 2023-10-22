//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Micol on 21.10.23.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc

    var body: some View {
        Button("Save") {
            // only saving if there is something to save
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

#Preview {
    ContentView()
}
