//
//  CompleteStory+CoreDataProperties.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 08/04/22.
//

import Foundation
import CoreData


extension CompleteStory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompleteStory> {
        return NSFetchRequest<CompleteStory>(entityName: "CompleteStory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var storyfull: String?

}

extension CompleteStory : Identifiable {

}
