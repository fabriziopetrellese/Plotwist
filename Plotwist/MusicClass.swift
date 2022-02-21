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
    private init() {}
    
    func setup(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "backgroundmusic", ofType: "mp3")!))
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
    
    func stop() {
        audioPlayer.pause()
        isPlaying = false
    }
}


var player: AVAudioPlayer?


func playFirst() {
    guard let url = Bundle.main.url(forResource: "backgroundmusic", withExtension: "mp3") else { return }
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        guard let player = player else { return }
        player.play()
    } catch let error {
        print(error.localizedDescription)
    }
}
