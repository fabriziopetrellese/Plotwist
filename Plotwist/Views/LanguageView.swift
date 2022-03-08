//
//  LanguageView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 20/02/22.
//

//import SwiftUI
//
//struct LanguageView: View {
//    @Environment(\.dismiss) var back6
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                    LanguageButtonModel(languageSelected: false, languages: "Language", flag: "english")
//                
//                LanguageButtonModel(languageSelected: false, languages: "Lingua", flag: "italian")
//                
//                LanguageButtonModel(languageSelected: false, languages: "Langue", flag: "french")
//                
//                LanguageButtonModel(languageSelected: false, languages: "Idioma", flag: "spanish")
//            }
//            .background(
//                Image("BACK")
//                    .ignoresSafeArea()
//            )
//            .navigationTitle("Language")
//            .navigationBarTitleDisplayMode(.inline)
//            
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Language")
//                        .font(Font.custom("Quick Pencil", size: 39))
//                }
//                
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        back6()
//                    } label: {
//                        Image(systemName: "arrowshape.turn.up.backward.fill")
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct LanguageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LanguageView()
//    }
//}
