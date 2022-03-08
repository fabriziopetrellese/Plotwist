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
    
    var body: some View {
        VStack {
            Text(finalTitle)
                .font(Font.custom("Life Savers", size: 39))
                .fontWeight(.heavy)
                .padding(.bottom, 20)
                .padding(.top)
                .offset(x: 0, y: -1)
            
            GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                Text(storiesModel.fullStory)
                    .padding()
                    .foregroundColor(.darkGray)
                    .font(Font.custom("Life Savers", size: 28))
//                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
            }
        }
            .offset(x: 0, y: 1)
            .padding(.vertical, 45)
            .frame(width: 360, height: 404, alignment: .center)
            
            Spacer()
            Button {
                let lang = String(format: NSLocalizedString("language", comment: ""))
                let utterance = AVSpeechUtterance(string: storiesModel.fullStory)
                utterance.voice = AVSpeechSynthesisVoice(language: lang)
                utterance.rate = 0.43
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            } label: {
                ButtonsIconModel(label: speech, icon: "person.wave.2.fill")
            }.padding(.top, 30)
            
            Button {
                alertClass.showingAlert = true
            } label: {
                ButtonsIconModel(label: menu, icon: "house.fill")
            }
            .padding(.bottom)
        }
        .padding(.bottom, 60)
        .background(
            Image("Background")
                .ignoresSafeArea()
        ).position(x: 207, y: 400)
        
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

