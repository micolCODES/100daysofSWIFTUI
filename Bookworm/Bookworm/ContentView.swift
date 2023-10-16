//
//  ContentView.swift
//  Bookworm
//
//  Created by Micol on 08.10.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastName = ["Granger", "Lovegood", "Potter", "Weasley"]
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

#Preview {
    ContentView()
}
