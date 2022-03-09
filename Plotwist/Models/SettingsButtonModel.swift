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
                
                Spacer()
                
                Image("ROTELLA")
                
            }
            .padding(.horizontal, 32)

        }
        .frame(width: 314, height: 80)

    }
}

struct SettingsButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonModel()
    }
}
