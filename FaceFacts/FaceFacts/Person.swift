//
//  Person.swift
//  FaceFacts
//
//  Created by Andrew Gilliland on 3/24/24.
//

import Foundation
import SwiftData

@Model
class Person {
var name: String
    var email: String
    var details: String
    
    init(name: String, email: String, details: String) {
        self.name = name
        self.email = email
        self.details = details
    }
}
