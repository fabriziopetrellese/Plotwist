//
//  Alert.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 05/03/22.
//

import AVFoundation
import Foundation

class AlertClass: ObservableObject {
    @Published var showingAlert = false
    @Published var yesQuit = false
    let synthesizer = AVSpeechSynthesizer()
    
    func handleSynthesizer(storiaCompleta: String, lingua: String) {
        if synthesizer.isSpeaking == false {
            let utterance = AVSpeechUtterance(string: storiaCompleta)
            utterance.voice = AVSpeechSynthesisVoice(language: lingua)
            utterance.rate = 0.42
            synthesizer.speak(utterance)
        } else {
            synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
        }
        if synthesizer.isPaused {
            synthesizer.continueSpeaking()
        }
    }
}
