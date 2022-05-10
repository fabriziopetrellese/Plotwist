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
//    let deleteStory: LocalizedStringKey = "deleteStory"
    let doneKeyboard: LocalizedStringKey = "doneKeyboard"
    
    @Environment(\.dismiss) var back11
    
    var body: some View {
        VStack {
            Spacer()
            TextField("", text: $newTitle)
                .placeholder(when: newTitle.isEmpty) {
                    Text(untitled)
                        .font(Font.custom("Life Savers", size: 32))
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                }
                .ignoresSafeArea(.keyboard)
                .font(Font.custom("Life Savers", size: 40).weight(.heavy))
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .frame(width: 286)
            
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
            .ignoresSafeArea(.keyboard)
            .frame(width: 1 * UIScreen.main.bounds.width, height: 0.4 * UIScreen.main.bounds.height)
            .padding(.top, 35)
            .padding(.bottom, 40)
            
            Spacer()
            
            Button {
                alertClass.handleSynthesizer(storiaCompleta: storyDatabase.storyfull!,
                                             lingua: lang)
            } label: {
                ZStack {
                    Image("rectButton")
                    HStack {
                        Text(speech)
                            .font(Font.custom("Life Savers", size: 31))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "playpause.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                    }
                    .padding(.horizontal, 26)
                    
                    Image("ominoListen")
                        .padding(.bottom, 93)
                }
                .frame(width: 218, height: 68)
            }
            .padding(.bottom, 60)
            .padding(.top, 50)
            .ignoresSafeArea(.keyboard)
//            Spacer()
        }
        .position(x: 0.502 * UIScreen.main.bounds.width, y: 0.4 * UIScreen.main.bounds.height)
        .ignoresSafeArea(.keyboard)
        .background(
            Image("BACK")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .position(x: 0.502 * UIScreen.main.bounds.width, y: 0.4 * UIScreen.main.bounds.height)
                .onTapGesture {
                    dismissKeyboard()
                }
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
                    Image(systemName: "trash")
                }
            }
            
            ToolbarItem(placement: .keyboard) {
                Button {
                    hideKeyboard()
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }
        .blur(radius: alertClass.showingAlert ? 12 : 0)
        alertClass.showingAlert == true ? AlertView() : nil
        

    }
}


//struct SingleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleView(newTitle: "", storyDatabase: <#T##CompleteStory#>)
//    }
//}

