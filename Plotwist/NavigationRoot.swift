//
//  NavigationRoot.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 01/03/22.
//

import Foundation

class NavigationRoot: ObservableObject {
    @Published var backToRoot = false
    
    @Published var mode1 = false
    @Published var mode2 = false
    @Published var playerButton = 0
}
