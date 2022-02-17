//
//  creditsView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 17/02/22.
//

import SwiftUI

struct creditsView: View {
    @State var showCredits = false
    
    var body: some View {
        ZStack {
            if showCredits {
                Image("showcredits")
                Image("ominicredits")
                    .offset(x: -80, y: -162)
                VStack {
                    Text("Credits")
                        .padding(.vertical, 12)
                        .font(Font.custom("Quick Pencil", size: 50))
                    Text("""
Created by:

Eleonora Franco
Fabrizio Petrellese
Giovanni Del Piano
Valerio Domenico Conte
""").multilineTextAlignment(.center)
                        .font(Font.custom("Quick Pencil", size: 31))
                        .padding(.bottom, 30)
                }
            } else {
                Image("MODES")
                Text("Credits")
                    .font(Font.custom("Quick Pencil", size: 50))
                Image("ominicredits")
                    .offset(x: -80, y: -70)
            }
        }
        .onTapGesture {
            showCredits = !showCredits
        }
    }
}

struct creditsView_Previews: PreviewProvider {
    static var previews: some View {
        creditsView()
    }
}
