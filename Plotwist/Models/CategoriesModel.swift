//
//  Categories.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 15/03/22.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let cat: LocalizedStringKey
}

class CategoriesModel: ObservableObject {
    @Published var categories: [Category] = [Category(cat: "cat1"),
                                             Category(cat: "cat2"),
                                             Category(cat: "cat3"),
                                             Category(cat: "cat4"),
                                             Category(cat: "cat5"),
                                             Category(cat: "cat6"),]
    
    @Published var selectedCategory: Int = 0;
    
    func selectCategory(category: LocalizedStringKey) {
        switch category {
        case "cat1":
            selectedCategory = 1
            
        case "cat2":
            selectedCategory = 2
            
        case "cat3":
            selectedCategory = 3
            
        case "cat4":
            selectedCategory = 4
            
        case  "cat5":
            selectedCategory = 5
            
        case "cat6":
            selectedCategory = 6
            
        default:
            selectedCategory = 0
        }
    }
    
}
