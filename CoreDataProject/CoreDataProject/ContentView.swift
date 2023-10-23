//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Micol on 21.10.23.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc

    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
                    List(wizards, id: \.self) { wizard in
                        Text(wizard.name ?? "Unknown")
                    }

                    Button("Add") {
                        let wizard = Wizard(context: moc)
                        wizard.name = "Harry Potter"
                    }

                    Button("Save") {
                        do {
                            try moc.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
// how to check if there's something to save before we actually save into CoreData
//        Button("Save") {
//            // only saving if there is something to save
//            if moc.hasChanges {
//                try? moc.save()
//            }
//        }
    }
}

#Preview {
    ContentView()
}
