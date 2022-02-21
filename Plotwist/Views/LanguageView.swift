//
//  LanguageView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 20/02/22.
//

import SwiftUI

struct LanguageView: View {
    @Environment(\.dismiss) var back6
    
    var body: some View {
        NavigationView {
            VStack {
                    SettingsButtonModel(languageSelected: false, languages: "Language", flag: "english")
                
                SettingsButtonModel(languageSelected: false, languages: "Lingua", flag: "italian")
                
                SettingsButtonModel(languageSelected: false, languages: "Langue", flag: "french")
                
                SettingsButtonModel(languageSelected: false, languages: "Idioma", flag: "spanish")
            }
            .background(
                Image("BACK")
                    .ignoresSafeArea()
            )
            .navigationTitle("Language")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Language")
                        .font(Font.custom("Quick Pencil", size: 39))
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        back6()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView()
    }
}
