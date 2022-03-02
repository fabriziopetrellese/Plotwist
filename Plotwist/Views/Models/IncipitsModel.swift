//
//  IncipitsModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 23/02/22.
//

import Foundation
import SwiftUI

class IncipitsModel: ObservableObject {
    @Published var incipits: [LocalizedStringKey] = ["incipit1", "incipit2", "incipit3", "incipit4", "incipit5", "incipit6"]
    
    
    @Published var currentIncipit: LocalizedStringKey = ""
    @Published var incipitIndex = 0
    @Published var j = 5
    
    func nextIncipit() {        
        incipitIndex = Int.random(in: 0...j)
        currentIncipit = incipits[incipitIndex]
        incipits.remove(at: incipitIndex)
        j -= 1
    }
}
