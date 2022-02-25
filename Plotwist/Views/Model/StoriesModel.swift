//
//  StoriesModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 25/02/22.
//

import Foundation

class StoriesModel: ObservableObject {
    @Published var stories: [String] = ["","","","","",""]
    @Published var index: Int = 0
    @Published var fullStory: String = ""
}
