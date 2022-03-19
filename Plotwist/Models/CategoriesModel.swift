//
//  Categories.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 15/03/22.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    let cat: LocalizedStringKey
    let id = UUID()
}

class CategoriesModel: ObservableObject {
    @Published var categories: [Category] = [Category(cat: "cat1"),
                                             Category(cat: "cat2"),
                                             Category(cat: "cat3"),
                                             Category(cat: "cat4"),
                                             Category(cat: "cat5"),
                                             Category(cat: "cat6"),]
    
    func selectCategory(category: LocalizedStringKey) -> Int {
        if category == "cat1" {
            return 1
        }
        if category == "cat2" {
            return 2
        }
        if category == "cat3" {
            return 3
        }
        if category == "cat4" {
            return 4
        }
        if category == "cat5" {
            return 5
        }
        if category == "cat6" {
            return 6
        }
        return 0
    }
    
}
