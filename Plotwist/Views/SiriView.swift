//
//  SiriView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 20/02/22.
//

import SwiftUI
import AVFoundation

struct SiriView: View {
    @EnvironmentObject var storiesModel: StoriesModel
        
    var body: some View {
        VStack {
            Text(storiesModel.fullStory)
                .padding()
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
            
            Button("Speak") {
                let utterance = AVSpeechUtterance(string: storiesModel.fullStory)
                utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
//                utterance.rate = 0.53
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }
            .font(.system(size: 25))
            .padding()
            .foregroundColor(.blue)
        }
        
    }
}
struct SiriView_Previews: PreviewProvider {
    static var previews: some View {
        SiriView()
    }
}
