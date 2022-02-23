//
//  IncipitsModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 23/02/22.
//

import Foundation
import SwiftUI

class IncipitsModel: ObservableObject {
    @Published var incipits: [String] = ["Once upon a time...",
                                         "At a certain point...",
                                         "Then...",
                                         "But suddenly...",
                                         "So...",
                                         "Finally"]
    
    
    @Published var currentIncipit: String = ""
    
    @Published var i = 0
    @Published var j = 5
    
        
    func nextIncipit() {
        
        i = Int.random(in: 0...j)
        currentIncipit = incipits[i]
        incipits.remove(at: i)
        j -= 1
    }
}
