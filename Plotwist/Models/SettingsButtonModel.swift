//
//  SettingsButtonModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 02/03/22.
//

import SwiftUI

struct SettingsButtonModel: View {
    @State var title: LocalizedStringKey = "Settings"
    var body: some View {
        ZStack {
            Image("MODES")
            HStack {
                Text(title)
                    .font(Font.custom("Life Savers", size: 26))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.leading, 4)
                
                Spacer()
                
                Image("ROTELLA")
            }
            .padding(.horizontal, 25)
        }
        .frame(width: 305, height: 72)
    }
}

struct SettingsButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonModel()
    }
}
