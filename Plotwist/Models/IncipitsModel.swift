//
//  IncipitsModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 23/02/22.
//

import Foundation
import SwiftUI

class IncipitsModel: ObservableObject {
    @Published var incipits: [String] = [String(format: NSLocalizedString("incipit1", comment: "")),
                                         String(format: NSLocalizedString("incipit2", comment: "")),
                                         String(format: NSLocalizedString("incipit3", comment: "")),
                                         String(format: NSLocalizedString("incipit4", comment: "")),
                                         String(format: NSLocalizedString("incipit5", comment: "")),
                                         String(format: NSLocalizedString("incipit6", comment: ""))]
    
    @Published var currentIncipit: String = ""
    @Published var incipitIndex = 0
    
    func nextIncipit() {
        currentIncipit = incipits[incipitIndex]
        incipitIndex += 1
    }
}
