//
//  SettingsView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var back3
    @State private var languageModal = false
    @State private var music = MusicClass.shared.isPlaying
    @State var musicIsAllowed = true
    
    var body: some View {
        VStack {
            if musicIsAllowed {
            Image("ominomusic")
                .offset(x: 110, y: 10)
            } else {
                Image("ominomusicOff")
                    .offset(x: 110, y: 10)
            }
            
            Toggle(isOn: $music) {
                Text("Music")
                    .font(Font.custom("Quick Pencil", size: 40))
            }
            .tint(.blue)
            .padding(.horizontal, 60)
            .onChange(of: music) { newValue in
                if newValue == true {
                    musicIsAllowed.toggle()
                    MusicClass.shared.play()
                } else {
                    musicIsAllowed.toggle()
                    MusicClass.shared.pause()
                }
            }
                
            Button {
                
            } label: {
                ZStack {
                    Image("settingsbutton")
                        .padding(.top, 30)
                    Text("""
Story starters
creation
""")
                        .font(Font.custom("Quick Pencil", size: 35))
                        .foregroundColor(.black)
                        .padding(.top, 27)
                }
            }
            
            
            Button {
                languageModal.toggle()
            } label: {
                ZStack {
                    Image("settingsbutton")
                        .padding(.bottom, 90)
                    HStack (spacing: 75) {
                        Text("Language")
                            .font(Font.custom("Quick Pencil", size: 40))
                            .foregroundColor(.black)
                            .padding(.bottom, 93)
                        Image("english")
                            .offset(x: 0, y: -47)
                    }
                }
            }
            .fullScreenCover(isPresented: $languageModal) {
                LanguageView()
            }
            creditsView()
            Spacer()
        }
        .offset(x: 0, y: -10)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Settings")
                    .font(Font.custom("Quick Pencil", size: 45))
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back3()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
