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
                .offset(x: 0, y: 7)
            
            Image("OMINO2")
                .offset(x: -160, y: 71)
            
            VStack {
                Text(title)
                    .font(Font.custom("Life Savers", size: 22))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(width: 160, height: 80)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 132)
                    .padding(.top, 30)
                
                Text(description)
                    .font(Font.custom("Life Savers", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.darkGray)
                    .frame(width: 247, height: 96)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 36)
                
            }
        }
    }
}

struct CardModel2_Previews: PreviewProvider {
    static var previews: some View {
        CardModel2()
    }
}
