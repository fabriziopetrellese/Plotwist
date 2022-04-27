//
//  SingleView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 26/04/22.
//

import SwiftUI
import AVFoundation

struct SingleView: View {
    @EnvironmentObject var alertClass: AlertClass
    @State var newTitle: String
    let storyDatabase: CompleteStory
    let untitled: LocalizedStringKey = "untitled"
    let speech: LocalizedStringKey = "speech"
    let lang = String(format: NSLocalizedString("language", comment: ""))
    
    @Environment(\.dismiss) var back11
    
    var body: some View {
        VStack {
            TextField("", text: $newTitle)
                .placeholder(when: newTitle.isEmpty) {
                    Text(untitled)
                        .font(Font.custom("Life Savers", size: 32))
                        .foregroundColor(.gray)
                }
                .font(Font.custom("Life Savers", size: 40))
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .frame(width: 360)
            
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    Text(storyDatabase.storyfull ?? "")
                        .font(Font.custom("Life Savers", size: 28))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.darkGray)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width)
                }
            }
            .frame(width: 360, height: 260)
            
            Button {
                alertClass.handleSynthesizer(storiaCompleta: storyDatabase.storyfull!,
                                             lingua: lang)
            } label: {
                ListenButton(label: speech, icon: "playpause.fill", shouldShowOmino: true)
                    .padding(.top, 36)
            }
        }
        .frame(width: 1 * UIScreen.main.bounds.width, height: 1 * UIScreen.main.bounds.height)
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    DataController.shared.editTitle(nuovoTitolo: newTitle, completeStory: storyDatabase)
                    alertClass.synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
                    back11()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    alertClass.synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
                    back11()
                    DataController.shared.deleteStory(completeStory: storyDatabase)
                } label: {
                    Text("Delete")
                }
            }
        }
        

    }
}

/*
struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
*/
