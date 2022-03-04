//
//  PlacementSettings.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 03/03/22.
//

import SwiftUI
import RealityKit
import Combine

class PlacementSettings: ObservableObject{
    
    //when the user select an object in BrowseView,  this propriety is set
    @Published var selectedModel: Model? {
        willSet(newValue){
            print ("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
    //when the use taps confirm in placement view, the value of selection is assigned to confirm model
    @Published var confirmedModel: Model? {
        willSet(newValue) {
            guard let model = newValue else{
                print ("clearing cofirm model")
                return
            }
            
            print ("Setting confirmedModel to \(model.name)")
            
            self.recentlyPlaced.append(model)
        }
    }
    //record of last e mostly recent object played in array
    @Published var recentlyPlaced: [Model] = []
    
    // cancell object from our scene
    var sceneObserver: Cancellable?
}
