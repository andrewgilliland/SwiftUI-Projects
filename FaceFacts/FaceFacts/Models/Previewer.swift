//
//  Previewer.swift
//  FaceFacts
//
//  Created by Andrew Gilliland on 3/26/24.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "Toga Party", location: "Faber College")
        person = Person(name: "Axel Foley", email: "axel@foley.com", details: "The heat is on.", metAt: event)
        
        container.mainContext.insert(person)
    }
}
