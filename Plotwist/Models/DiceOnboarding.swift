//
//  DiceOnboarding.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 22/04/22.
//

import SwiftUI

struct DiceOnboarding: View {
    let diceIcon: LocalizedStringKey = "diceIcon"
    
    var body: some View {
        ZStack {
            Image("onb3")
            
            VStack {
                Text(diceIcon)
                    .font(Font.custom("Life Savers", size: 15))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .frame(width: 84, height: 38)
            }
            .padding(.bottom, 80)
            .padding(.leading, 40)
        }
    }
}

struct DiceOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        DiceOnboarding()
            .environment(\.locale, .init(identifier: "ru"))
    }
}
