//
//  CatalogView.swift
//  SpacePhotos
//
//  Created by Andrew Gilliland on 5/23/23.
//

import SwiftUI

struct CatalogView: View {
    @StateObject private var photos = Photos()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photos.items) { item in
                    PhotoView(photo: item)
                        .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Catalog")
            .listStyle(.plain)
            .refreshable {
                await photos.updateItems()
            }
        }
        .task {
            await photos.updateItems()
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
