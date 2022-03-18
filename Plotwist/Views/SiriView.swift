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
    @EnvironmentObject var navigationRoot: NavigationRoot
    @EnvironmentObject var alertClass: AlertClass
        
    let finalTitle: LocalizedStringKey = "finalTitle"
    let language: LocalizedStringKey = "language"
    let speech: LocalizedStringKey = "speech"
    let menu: LocalizedStringKey = "menu"
    
//    let synthesizer = AVSpeechSynthesizer()
    let lang = String(format: NSLocalizedString("language", comment: ""))


    
    var body: some View {
        VStack {
            Text(finalTitle)
                .font(Font.custom("Life Savers", size: 39))
                .fontWeight(.heavy)
            Spacer()
            
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    Text(storiesModel.fullStory)
                        .font(Font.custom("Life Savers", size: 28))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.darkGray)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width)
                }
            }
            .frame(width: 360, height: 260)
                        
            Spacer()
            
            Button {
                if alertClass.synthesizer.isSpeaking == false {
                    let utterance = AVSpeechUtterance(string: storiesModel.fullStory)
                    utterance.voice = AVSpeechSynthesisVoice(language: lang)
                    utterance.rate = 0.42
                    alertClass.synthesizer.speak(utterance)
                } else {
                    alertClass.synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
                }
                if alertClass.synthesizer.isPaused {
                    alertClass.synthesizer.continueSpeaking()
                }
            } label: {
                ButtonsIconModel(label: speech, icon: "person.wave.2.fill")
            }
            
            Button {
                alertClass.showingAlert = true
//                alertClass.synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
            } label: {
                ButtonsIconModel(label: menu, icon: "house.fill")
            }
        }
        .padding(.top, 30)
        .background(
            Image("Background")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .blur(radius: alertClass.showingAlert ? 9 : 0)
        if alertClass.showingAlert == true {
            AlertView()
        }
    }
}
struct SiriView_Previews: PreviewProvider {
    static var previews: some View {
        SiriView()
            .environmentObject(StoriesModel())
            .environmentObject(AlertClass())
    }
}

