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
                .foregroundColor(.darkGray)
                .font(Font.custom("Quick Pencil", size: 27))
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
            
            Button {
                
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

@ViewBuilder
func mainMenu(home: Bool) -> some View {
    if home {
        ContentView()
    }
}
