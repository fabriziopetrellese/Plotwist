//
//  ReunitedView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 28/04/22.
//

import SwiftUI

struct ReunitedView: View {
    let wellDone: LocalizedStringKey = "wellDone"
    let gatherAround: LocalizedStringKey = "gatherAround"
    let weReady: LocalizedStringKey = "weReady"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(wellDone)
                .font(Font.custom("Life Savers", size: 37))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 28)
//                .padding(.bottom)
            
            Text(gatherAround)
                .font(Font.custom("Life Savers", size: 34))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 33)
                .padding(.top, 30)
//                .padding(.bottom)
            
            Spacer()
            
            NavigationLink {
                SiriView()
            } label: {
                ZStack {
                    Image("buttonback")
                    HStack {
                        Text(weReady)
                            .font(Font.custom("Life Savers", size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(width: 218, height: 80)
                    }
                }
            }
//            .padding(.top, 50)
            .padding(.bottom, 60)
        }
        .frame(height: 0.9 * UIScreen.main.bounds.height)
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct ReunitedView_Previews: PreviewProvider {
    static var previews: some View {
        ReunitedView()
            .environment(\.locale, .init(identifier: "it"))
    }
}
