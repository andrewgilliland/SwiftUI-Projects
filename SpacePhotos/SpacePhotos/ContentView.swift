//
//  ContentView.swift
//  SpacePhotos
//
//  Created by Andrew Gilliland on 5/23/23.
//

// Discover concurrency in SwiftUI
// https://developer.apple.com/videos/play/wwdc2021/10019/

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CatalogView().tabItem {
                Label("Catalog", systemImage: "book")
            }
            
            SavedView().tabItem {
                Label("Saved", systemImage: "folder")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
