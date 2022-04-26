//
//  OminiOnboarding.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 22/04/22.
//

import SwiftUI

struct OminiOnboarding: View {
    var body: some View {
        ZStack {
            Image("omini_onboarding")
            
            Text("you")
                .font(Font.custom("Life Savers", size: 15))
                .fontWeight(.heavy)
                .padding(.bottom, 160)
                .padding(.leading, 56)

            Text("random people")
                .font(Font.custom("Life Savers", size: 15))
                .fontWeight(.heavy)
                .padding(.top, 172)
        }
    }
}

struct OminiOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        OminiOnboarding()
    }
}
