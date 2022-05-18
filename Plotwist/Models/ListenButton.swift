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
    
    var body: some View {
        ZStack {
            Image("rectButton")
                .resizable()
                .frame(width: 230, height: 73)
            
            HStack {
                Text(label)
                    .font(Font.custom("Life Savers", size: 27.5))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 27, height: 27)
            }
            .padding(.horizontal, 34)
        }
        .frame(width: 250, height: 68)
    }
}


struct ListenButton_Previews: PreviewProvider {
    static var previews: some View {
        ListenButton(label: "Listen",
                     icon: "playpause.fill")
    }
}

