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
                .frame(width: 310, height: 444, alignment: .center)
                .padding()
                .font(.system(size: 25))
                .multilineTextAlignment(.center)

            Button {
                let utterance = AVSpeechUtterance(string: storiesModel.fullStory)
                utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
//                utterance.rate = 0.53
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            } label: {
                ButtonsIconModel(label: "Speech", icon: "person.wave.2.fill")
            }
            .padding()
            
            NavigationLink {
                ContentView()
            } label: {
                ButtonsIconModel(label: "Menu", icon: "house.fill")
            }
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
    }
}
struct SiriView_Previews: PreviewProvider {
    static var previews: some View {
        SiriView()
            .environmentObject(StoriesModel())
    }
}
