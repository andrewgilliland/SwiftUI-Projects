//
//  NotesView.swift
//  BookWorm
//
//  Created by Andrew Gilliland on 5/24/23.
//

import SwiftUI

struct NotesView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
