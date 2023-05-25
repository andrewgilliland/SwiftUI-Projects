//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Andrew Gilliland on 5/25/23.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var year: Int16
    @NSManaged public var director: String?
    @NSManaged public var title: String?
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }

}

extension Movie : Identifiable {

}
