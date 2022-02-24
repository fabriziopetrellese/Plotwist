//
//  PlayersModel.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 22/02/22.
//

import Foundation
import SwiftUI

class PlayersModel: ObservableObject {
    @Published var players = ["","","","","",""]
    @Published var activePlayer = ""
    @Published var i = 1
    @Published var j = 0
    //@Published var prova = 0
    
    func nextPlayer() {
        activePlayer = players[i]
        i += 1
        if activePlayer.isEmpty {
            activePlayer = players[j]
            j += 1
            if j > 1 {
                j = 0
            }
        }
        //prova += 1
        //print(prova)
    }
}
