//
//  CardModel2.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 02/03/22.
//

import SwiftUI

struct CardModel2: View {
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    
    var body: some View {
        ZStack {
            Image("CARD1")
            
            Image("OMINO2")
                .padding(.trailing, 316)
                .padding(.top, 142)
            
            VStack {
                Text(title)
                    .font(Font.custom("Life Savers", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 142)
                    .padding(.horizontal, 23)
                
                Text(description)
                    .foregroundColor(.darkGray)
                    .font(Font.custom("Life Savers", size: 22))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 25)
                    .padding(.bottom, 32)
                    .padding(.horizontal, 42)
            }
        }
        .frame(width: 306, height: 185, alignment: .center)
    }
}

struct CardModel2_Previews: PreviewProvider {
    static var previews: some View {
        CardModel2(title: "Dice Storytelling", description: "Create a story with only dice")
    }
}

