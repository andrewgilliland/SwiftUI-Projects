//
//  EditEventView.swift
//  FaceFacts
//
//  Created by Andrew Gilliland on 3/25/24.
//

import SwiftUI

struct EditEventView: View {
    @Bindable var event: Event
    
    var body: some View {
        Form {
            TextField("Name of the event", text: $event.name)
            TextField("Location", text: $event.location)
        }
        .navigationTitle("Edit \($event.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditEventView()
//}
