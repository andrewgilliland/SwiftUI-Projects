//
//  SavePhotoButton.swift
//  SpacePhotos
//
//  Created by Andrew Gilliland on 5/23/23.
//

import SwiftUI

struct SavePhotoButton: View {
    var photo: SpacePhoto
    @State private var isSaving = false
    
    var body: some View {
        Button {
            async {
                isSaving = true
                await photo.save()
                isSaving = false
            }
        } label: {
            Text("Save")
                .opacity(isSaving ? 0 : 1)
                .overlay {
                    if isSaving {
                        ProgressView()
                    }
                }
        }
        .disabled(isSaving)
        .buttonStyle(.bordered)
    }
}

struct SavePhotoButton_Previews: PreviewProvider {
    static var previews: some View {
        SavePhotoButton()
    }
}
