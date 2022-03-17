//
//  CardModel2.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 02/03/22.
//

import SwiftUI

struct CardModel2: View {
    @State var title: LocalizedStringKey = "Dice Storytelling"
    @State var description: LocalizedStringKey = "Create a story with only dice"
    
    var body: some View {
        ZStack {
            Image("CARD1")
            
            Image("OMINO2")
                .offset(x: -160, y: 71)
//                .padding(.trailing, 320)
//                .padding(.top, 142)
            
            VStack {
                Text(title)
                    .font(Font.custom("Life Savers", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 142)
                    .padding(.horizontal, 51)
                    .padding(.bottom, 27)
                
                Text(description)
                    .font(Font.custom("Life Savers", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.darkGray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                    .padding(.horizontal, 70)
            }
        }
    }
}

struct CardModel2_Previews: PreviewProvider {
    static var previews: some View {
        CardModel2()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
