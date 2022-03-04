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
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Final story:")
                .font(Font.custom("Quick Pencil", size: 45))
                .padding(.bottom, 27)
            
            GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                Text(storiesModel.fullStory)
                    .padding()
                    .foregroundColor(.darkGray)
                    .font(Font.custom("Quick Pencil", size: 34))
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
            }
        }
            .padding(.bottom, 15)
            .frame(width: 360, height: 404, alignment: .center)
            
            Spacer()
            Button {
                let utterance = AVSpeechUtterance(string: storiesModel.fullStory)
                utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
                utterance.rate = 0.42
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            } label: {
                ButtonsIconModel(label: "Speech", icon: "person.wave.2.fill")
            }
            
            Button {
                showingAlert = true
            } label: {
                ButtonsIconModel(label: "Menu", icon: "house.fill")
            }
            .alert("Do you want to end the game?", isPresented: $showingAlert) {
                Button ("Yes", role: .destructive) {
                    navigationRoot.mode1 = false
                    navigationRoot.backToRoot = true
                    navigationRoot.playerButton = 0
                }
                Button ("No", role: .cancel) {}
            } message: {
                Text("You will go back to the main menu")
            }
        }
        .padding(.bottom, 10)
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

