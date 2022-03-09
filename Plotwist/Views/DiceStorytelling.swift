//
//  DiceStorytelling.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct DiceStorytelling: View {
    @EnvironmentObject var alertClass: AlertClass
    @EnvironmentObject var navigationRoot: NavigationRoot
    let diceTitle: LocalizedStringKey = "diceTitle"
    let rollDice: LocalizedStringKey = "rollDice"
    
    var body: some View {
        VStack {
            Text(diceTitle)
                .font(Font.custom("Life Savers", size: 39))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 250)
                .position(x: 207, y: 65)
            
            Spacer()
            
            NavigationLink {
                DiceView()
            } label: {
                ButtonsModel(label: rollDice)
            }.position(x: 207, y: 270)
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
        ).position(x: 207, y: 400)
            .blur(radius: alertClass.showingAlert ? 9 : 0)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        alertClass.showingAlert = true
                    } label: {
                        Image(systemName: "house.fill")
                            .foregroundColor(.black)
                    }
                }
            }
        if alertClass.showingAlert == true {
            AlertView()
        }
    }
}

struct DiceStorytelling_Previews: PreviewProvider {
    static var previews: some View {
        DiceStorytelling()
            .environmentObject(NavigationRoot())
            .environmentObject(AlertClass())
    }
}

