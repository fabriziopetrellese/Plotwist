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
    @Published var turnNumber = 0
    
    func nextFirstMode(storia: String, inizio: String) {
        stories[index] = storia
        fullStory += inizio + " " + storia + ". "
        index += 1
        turnNumber += 1
    }
    
    func nextSecondMode(storia: String) {
        stories[index] = storia
        fullStory += storia + ". "
        index += 1
        turnNumber += 1
    }
    
    func lastFourWords() -> String {
        let str = stories[index - 1]
        let split = str.split(separator: " ")
        let lastFour = String(split.suffix(4).joined(separator: [" "]))
        return lastFour
    }
}

extension StringProtocol {
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}
