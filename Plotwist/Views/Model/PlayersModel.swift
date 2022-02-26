//
//  PlayersModel.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 22/02/22.
//

import Foundation

class PlayersModel: ObservableObject {
    @Published var playersNames = ["","","","","",""]
    @Published var activePlayers = [String]()
    @Published var activePlayer = ""
    @Published var indexNumber = 1
    @Published var j = 0
    
    func setUpPlayers() {
        playersNames.forEach { playerName in
            if !playerName.isEmpty {
                activePlayers.append(playerName)
            }
        }
    }
    
    func nextPlayer() {
        activePlayer = activePlayers[indexNumber]
        indexNumber += 1
        indexNumber = indexNumber % activePlayers.count
    }
}
