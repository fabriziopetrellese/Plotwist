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
    
    let musicTranslation: LocalizedStringKey = "musicTranslation"
    let startersCreation: LocalizedStringKey = "startersCreation"
    let language: LocalizedStringKey = "language"
    let settings: LocalizedStringKey = "settings"
    
    var body: some View {
        VStack {
/*
            if music {
            Image("ominomusic")
                    .padding(.leading, 197)
                    .frame(width: 1 * UIScreen.main.bounds.width, height: 0.107 * UIScreen.main.bounds.height)
            } else {
                Image("ominomusicOff")
                    .padding(.leading, 197)
                    .frame(width: 1 * UIScreen.main.bounds.width, height: 0.107 * UIScreen.main.bounds.height)
            }
            
            Toggle(isOn: $music) {
                Text(musicTranslation)
                    .font(Font.custom("Life Savers", size: 29))
                    .fontWeight(.heavy)
            }
            .tint(.blue)
            .padding(.horizontal, 60)
            .padding(.top, -12)
            .onChange(of: music) { newValue in
                if newValue == true {
                    MusicClass.shared.play()
                } else {
                    MusicClass.shared.pause()
                }
            }
*/
            NavigationLink {
                CompletedStories()
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
/*
            NavigationLink {
                CompletedStories()
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
 */
            CreditsView()
                .padding(.top, 65)
            Spacer()
        }
        .padding(.top, -10)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(settings)
                    .font(Font.custom("Life Savers", size: 31))
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
