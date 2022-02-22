//
//  PlayersModel.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 22/02/22.
//

import Foundation
import SwiftUI
import Combine

class PlayersModel: ObservableObject {
    
    private static let userDefaultName1 = "name1"
    private static let userDefaultName2 = "name2"

    @Published var name1 = UserDefaults.standard.string(forKey: PlayersModel.userDefaultName1) ?? "" {
        didSet {
          UserDefaults.standard.set(self.name1, forKey: PlayersModel.userDefaultName1)
        }
    }
    @Published var name2 = UserDefaults.standard.string(forKey: PlayersModel.userDefaultName2) ?? "" {
        didSet {
          UserDefaults.standard.set(self.name2, forKey: PlayersModel.userDefaultName2)
        }
    }

    private var canc: AnyCancellable!
}


