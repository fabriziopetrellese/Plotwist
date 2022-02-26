//
//  IncipitsModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 23/02/22.
//

import Foundation
//import SwiftUI

class IncipitsModel: ObservableObject {
    @Published var incipits = ["Once upon a time...",
                               "At a certain point...",
                               "Then...",
                               "But suddenly...",
                               "So...",
                               "Finally"]
    
    
    @Published var currentIncipit = ""
    @Published var incipitIndex = 0
    @Published var j = 5
//    @Published var incipitNumber = 0
    
    
    func nextIncipit() {        
        incipitIndex = Int.random(in: 0...j)
        currentIncipit = incipits[incipitIndex]
        incipits.remove(at: incipitIndex)
        j -= 1
//        incipitNumber += 1
    }
}
