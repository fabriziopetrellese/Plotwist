//
//  IncipitsModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 23/02/22.
//

import Foundation

class IncipitsModel: ObservableObject {
    @Published var incipits = ["Once upon a time...",
                               "Every day...",
                               "But one day...",
                               "Because of that...",
                               "Until finally...",
                               "And ever since then"]
    
    
    @Published var currentIncipit = ""
    @Published var incipitIndex = 0
    @Published var j = 5
    
    func nextIncipit() {        
        incipitIndex = Int.random(in: 0...j)
        currentIncipit = incipits[incipitIndex]
        incipits.remove(at: incipitIndex)
        j -= 1
    }
}
