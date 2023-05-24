//
//  StudentView.swift
//  BookWorm
//
//  Created by Andrew Gilliland on 5/24/23.
//

import SwiftUI

struct StudentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Axel", "Biff", "Burt", "Tanya"]
                let lastNames = ["Foley", "Tannen", "Reynolds", "Harding"]
                
                let chosenFirstName = firstNames.randomElement()!
                let choseLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(choseLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
