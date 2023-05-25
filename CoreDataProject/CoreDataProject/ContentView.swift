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

struct ContentView: View {
    let students = [Student(name:"Axel Foley"), Student(name: "Biff Tannen")]
    
    var body: some View {
        List {
            ForEach(students, id: \.self) { student in
                Text(student.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
