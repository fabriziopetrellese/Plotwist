//
//  DataController.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 08/04/22.
//

import Foundation
import CoreData
import UIKit

final class DataController {
    
    let container: NSPersistentContainer
    static let shared = DataController()
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: "PlotwistDatabase")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try viewContext.save()
            } catch {
                viewContext.rollback()
                print(error.localizedDescription)
            }
        }
    }

    func saveStory(storia: String) {
        let newStory = CompleteStory(context: viewContext)
        newStory.id = UUID()
        newStory.storyfull = storia
        save()
    }
    
    func deleteStory(completeStory: CompleteStory) {
        viewContext.delete(completeStory)
        save()
    }
    
    
}
