//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Andrew Gilliland on 5/25/23.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

//struct Wizard: Hashable {
//    let name: String
//}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    let students = [Student(name:"Axel Foley"), Student(name: "Biff Tannen")]
    
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
        
//        List {
//            ForEach(students, id: \.self) { student in
//                Text(student.name)
//            }
//
//            Button("Save") {
//                if moc.hasChanges {
//                    try? moc.save()
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
