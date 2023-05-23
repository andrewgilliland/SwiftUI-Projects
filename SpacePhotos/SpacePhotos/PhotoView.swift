//
//  PhotoView.swift
//  SpacePhotos
//
//  Created by Andrew Gilliland on 5/23/23.
//

import SwiftUI

struct PhotoView: View {
    var photo: SpacePhoto
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: photo.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(minWidth: 0, minHeight: 400)
            
            HStack {
                Text(photo.title)
                Spacer()
            }
            .padding()
            .background(.thinMaterial)
        }
        .background(.thinMaterial)
        .mask(RoundedRectangle(cornerRadius: 16))
        .padding(.bottom, 8)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photo: SpacePhoto())
    }
}
