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
}
