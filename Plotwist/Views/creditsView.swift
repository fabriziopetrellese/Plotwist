//
//  CreditsView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 17/02/22.
//

import SwiftUI

struct CreditsView: View {
    @State private var showCredits = false
    let credits: LocalizedStringKey = "credits"
    let createdBy: LocalizedStringKey = "createdBy"
    let russianBy: LocalizedStringKey = "russianBy"
    
    var body: some View {
        ZStack {
            if showCredits {
                Image("showcredits2")
                Image("ominicredits")
                    .offset(x: -80, y: -199)
                VStack {
                    Text(credits)
                        .font(Font.custom("Life Savers", size: 37))
                        .fontWeight(.heavy)
                        .offset(x: 0, y: -22.5)
                    Text(createdBy)
                        .font(Font.custom("Life Savers", size: 23))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -10)
                    Text("Valerio Domenico Conte")
                        .font(Font.custom("Life Savers", size: 25))
                        .fontWeight(.bold)
                    Text("Giovanni Del Piano")
                        .font(Font.custom("Life Savers", size: 25))
                        .fontWeight(.bold)
                    Text("Fabrizio Petrellese")
                        .font(Font.custom("Life Savers", size: 25))
                        .fontWeight(.bold)
                    Text("Eleonora Franco")
                        .font(Font.custom("Life Savers", size: 25))
                        .fontWeight(.bold)
                        Text(russianBy)
                            .font(Font.custom("Life Savers", size: 25))
                            .offset(x: 0, y: 19)
                    Text("Natalia Kuznetsova")
                        .font(Font.custom("Life Savers", size: 24))
                        .offset(x: 0, y: 22)
                }
            } else {
                Image("settingsbutton")
                Text(credits)
                    .font(Font.custom("Life Savers", size: 37))
                    .fontWeight(.heavy)
                Image("ominicredits")
                    .offset(x: -80, y: -70)
            }
        }
        .onTapGesture {
            showCredits = !showCredits
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
