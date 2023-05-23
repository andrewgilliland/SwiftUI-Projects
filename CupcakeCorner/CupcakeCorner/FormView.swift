//
//  FormView.swift
//  CupcakeCorner
//
//  Created by Andrew Gilliland on 5/22/23.
//

import SwiftUI

struct FormView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
        .preferredColorScheme(.dark)
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
