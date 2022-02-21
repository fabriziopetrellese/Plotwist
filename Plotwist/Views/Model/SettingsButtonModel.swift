//
//  SettingsButtonModel.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 21/02/22.
//

import SwiftUI

struct SettingsButtonModel: View {
    @State var languageSelected = false
    var languages: String
    var flag = ""
    var flag2 = ""
    var flag3 = ""
    var flag4 = ""
    
    var body: some View {
        ZStack {
            let categoryButton = RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 75)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: -1.5, y: 2)
            
            let categoryButtonSelected = RoundedRectangle(cornerRadius: 19)
                .strokeBorder(Color.yellowSelection, lineWidth: 5)
                .frame(width: 300, height: 75)
                .foregroundColor(.white)
            
            
            if languageSelected {
                ZStack {
                    categoryButton
                    categoryButtonSelected
                    HStack {
                        Text(languages)
                            .font(Font.custom("Quick Pencil", size: 45))
                        Spacer()
                        Image(flag)
                    }.padding(.horizontal, 33)
                }.frame(width: 320, height: 96, alignment: .center)
            } else {
                ZStack {
                    categoryButton
                    HStack {
                        Text(languages)
                            .font(Font.custom("Quick Pencil", size: 45))
                        Spacer()
                        Image(flag)
                    }.padding(.horizontal, 33)
                }.frame(width: 320, height: 96, alignment: .center)
            }
        }
        .onTapGesture {
            languageSelected = !languageSelected
        }
        
    }
    
}

struct SettingsButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonModel(languages: "")
    }
}