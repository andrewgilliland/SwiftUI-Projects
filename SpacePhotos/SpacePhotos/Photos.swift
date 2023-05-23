//
//  Photos.swift
//  SpacePhotos
//
//  Created by Andrew Gilliland on 5/23/23.
//

import Foundation

@MainActor
class Photos: ObservableObject {
    @Published private(set) var items: [SpacePhoto] = []
    
    func updateItems() async {
        let fetched = await fetchPhotos()
        items = fetched
    }
    
    func fetchPhotos() async -> [SpacePhoto] {
        var downloaded: [SpacePhoto] = []
        for date in randomPhotoDates() {
            let url = SpacePhoto.requestFor(date: date)
            if let photo = await fetchPhoto(from: url) {
                downloaded.append(photo)
            }
        }
    }
    
    func fetchPhoto(from url:URL) async -> SpacePhoto? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try SpacePhoto(data: data)
        } catch {
            return nil
        }
    }

    
}
