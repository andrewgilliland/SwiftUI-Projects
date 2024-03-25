//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Andrew Gilliland on 3/24/24.
//

import SwiftUI

struct EditPersonView: View {
    @Bindable var person: Person
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email", text: $person.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section {
                TextField("Details about \(person.name)", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit \(person.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditPersonView()
//}
