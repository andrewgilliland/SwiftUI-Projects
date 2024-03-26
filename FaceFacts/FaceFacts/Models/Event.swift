//
//  Event.swift
//  FaceFacts
//
//  Created by Andrew Gilliland on 3/25/24.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var people = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
