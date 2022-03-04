//
//  Model.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 03/03/22.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable{
    case Fantasy
    case Emotion
    case Food
    case Games
    case Dadi
    case Dado
    case Pegasus
    case Provola
    case Baccano
    case Dadi1
    
    var lable: String{
        get {
            switch self{
            case .Fantasy:
                return "Fantasy"
            case .Emotion:
                return "Emotion"
            case .Food:
                return "Food"
            case .Games:
                return "Games"
            case .Dadi:
                return "Dadi"
            case .Dado:
                return "Dado"
            case .Pegasus:
                return "Pegasus"
            case .Provola:
                return "Provola"
            case .Baccano:
                return "Baccano"
            case .Dadi1:
                return "Dadi1"
            }
        }
    }
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    private var cancellable: AnyCancellable?
    
    init (name: String, category: ModelCategory, scaleCompensation: Float = 1.0){
        self .name = name
        self .category = category
        self .thumbnail = UIImage (named : name) ?? UIImage (systemName: "photo")!
        self.scaleCompensation = scaleCompensation
        
    }
    
    func asyncLoadModelEntity(){
        let filename = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                
                switch loadCompletion{
                case.failure(let error): print ("unable to load model for \(filename). Error: \(error.localizedDescription)")
                case.finished:
                    break
                }
            }, receiveValue: {modelEntity in
              
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
                
                print ("modelEntity for \(self.name) has been loaded")
            })
    }
}

struct Models {
    var all: [Model] = []
    
    init (){
        // Here you download all the model and regroup in array of the same category
        let Dice1 = Model (name: "Dado", category: .Dado, scaleCompensation: 10/100)
        let Dice2 = Model (name: "foodDice", category: .Dado, scaleCompensation: 10/100)
        
        self.all += [Dice1,Dice2]
        
        // theme 2
        let Pegasus = Model (name: "Pegasus", category: .Pegasus, scaleCompensation: 10/100)
        
        self.all += [Pegasus]
        
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter( {$0.category == category})
    }
}
