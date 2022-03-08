//
//  CardModel1.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 02/03/22.
//

import SwiftUI

struct CardModel1: View {
    @State var title: LocalizedStringKey = "Guided Storytelling"
    @State var description: LocalizedStringKey = "Create a story with the help of story starters and dice"
    
    
    var body: some View {
        ZStack {
            Image("CARD1")
            
            Image("OMINO1")
                .offset(x: 100, y: -103)
            
            VStack {
                Text(title)
                    .font(Font.custom("Life Savers", size: 23))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(width: 170, height: 79)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 136)
                    .padding(.top, 12)
                
                Text(description)
                    .foregroundColor(.darkGray)
                    .font(Font.custom("Life Savers", size: 23))
                    .bold()
                    .frame(width: 247, height: 96)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 34)
                
            }
            

        }
    }
}

struct CardModel1_Previews: PreviewProvider {
    static var previews: some View {
            CardModel1()
    }
}
