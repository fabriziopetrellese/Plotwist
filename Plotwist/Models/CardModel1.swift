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
                    .font(Font.custom("Quick Pencil", size: 30))
                    .foregroundColor(.black)
                    .frame(width: 190, height: 79)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 136)
                
                Text(description)
                    .foregroundColor(.darkGray)
                    .font(Font.custom("Quick Pencil", size: 29))
                    .frame(width: 247, height: 96)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
            }
            

        }
    }
}

struct CardModel1_Previews: PreviewProvider {
    static var previews: some View {
        CardModel1()
    }
}
