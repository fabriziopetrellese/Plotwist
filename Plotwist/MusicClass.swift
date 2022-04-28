//
//  MusicClass.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 20/02/22.
//

//import SwiftUI
import AVFoundation

class MusicClass {
    static let shared = MusicClass()
    var isPlaying = true
    var audioPlayer = AVAudioPlayer()
    
    func setup(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "musicBack", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    func play() {
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        audioPlayer.volume = 0.1
        isPlaying = true
    }
    
    func pause() {
        audioPlayer.pause()
        isPlaying = false
    }
}
