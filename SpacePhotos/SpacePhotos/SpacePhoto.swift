//
//  SpacePhoto.swift
//  SpacePhotos
//
//  Created by Andrew Gilliland on 5/23/23.
//

import Foundation

struct SpacePhoto {
    var title: String
    var description: String
    var date: Date
    var url: URL
    
    init() {
        
    }
    
    func save() async {
        print("Save!!!")
    }
}

extension SpacePhoto: Codable, Identifiable {}
//extension SpacePhoto:  {}
