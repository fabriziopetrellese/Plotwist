//
//  PlayersModel.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 22/02/22.
//

import Foundation
//import SwiftUI

class PlayersModel: ObservableObject {
    @Published var playersNames = ["","","","","",""]
    @Published var activePlayers = [String]()
    @Published var activePlayer = ""
    @Published var i = 1
    @Published var j = 0
    //@Published var prova = 0
    
    func setUpPlayers() {
        playersNames.forEach { playerName in
            if !playerName.isEmpty {
                activePlayers.append(playerName)
            }
        }
    }
    
    func nextPlayer() {
        activePlayer = activePlayers[i]
        i += 1
        i = i % activePlayers.count
        //prova += 1
        //print(prova)
    }
}
