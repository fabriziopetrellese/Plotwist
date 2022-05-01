//
//  CompleteStory+CoreDataProperties.swift
//  
//
//  Created by Fabrizio Petrellese on 01/05/22.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension CompleteStory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompleteStory> {
        return NSFetchRequest<CompleteStory>(entityName: "CompleteStory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var storyfull: String?
    @NSManaged public var storytitle: String?

}

extension CompleteStory : Identifiable {

}
