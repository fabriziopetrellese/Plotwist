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
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 28)
                .padding(.bottom)
            
            Text(gatherAround)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 33)
                .padding(.top, 30)
            
            Spacer()
            
            Button {
                
            } label: {
//                ButtonsModel(label: weReady)
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
            .padding(.bottom)
        }
        .background(
            Image("BACK")
        )
    }
}

struct ReunitedView_Previews: PreviewProvider {
    static var previews: some View {
        ReunitedView()
//            .environment(\.locale, .init(identifier: "de"))
    }
}
