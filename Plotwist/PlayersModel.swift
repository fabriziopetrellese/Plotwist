//
//  PlayersModel.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 22/02/22.
//

import Foundation
import SwiftUI

class PlayersModel: ObservableObject {
    @Published var players: [String] = ["","","","","",""]
    @Published var activePlayer: String = ""
    @Published var i: Int = 1
    
    func nextPlayer() {
        activePlayer = players[i]
        i += 1
    }
}


