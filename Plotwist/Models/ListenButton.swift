//
//  ListenButton.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 26/04/22.
//

import SwiftUI

struct ListenButton: View {
    let label: LocalizedStringKey
    let icon: String
    let shouldShowOmino: Bool
    
    var body: some View {
        ZStack {
            if shouldShowOmino {
                Image("faceButton")
                    .padding(.bottom, 88)
            }
            
            Image("rectButton")
            
            HStack {
                Text(label)
                    .font(Font.custom("Life Savers", size: 31))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)

            }
            .padding(.horizontal, 26)
            
            if shouldShowOmino {
                Image("handsButton")
                    .padding(.bottom, 72)
            }
        }
        .frame(width: 218, height: 68)
    }
}


struct ListenButton_Previews: PreviewProvider {
    static var previews: some View {
        ListenButton(label: "Listen",
                     icon: "playpause.fill",
                     shouldShowOmino: true)
    }
}

