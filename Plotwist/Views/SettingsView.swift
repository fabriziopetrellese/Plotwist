//
//  SettingsView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var back3
    @State private var music = MusicClass.shared.isPlaying
    @State private var musicIsAllowed = true
    
    let musicTranslation: LocalizedStringKey = "musicTranslation"
    let startersCreation: LocalizedStringKey = "startersCreation"
    let language: LocalizedStringKey = "language"
    let settings: LocalizedStringKey = "settings"
    
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
                Text(musicTranslation)
                    .font(Font.custom("Life Savers", size: 29))
                    .fontWeight(.heavy)
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
                    HStack {
                        Text(startersCreation)
                            .font(Font.custom("Life Savers", size: 29))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.top, 27)
                    }.padding(.horizontal, 68)
                }
            }
            creditsView()
                .offset(x: 0, y: 65)
            Spacer()
        }
        .offset(x: 0, y: -10)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(settings)
                    .font(Font.custom("Life Savers", size: 33))
                    .fontWeight(.heavy)
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
