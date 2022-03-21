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
                .padding(.horizontal, 30)
            
            Spacer()
            
            NavigationLink {
                DiceCategories()
            } label: {
                ButtonsModel(label: rollDice)
                    .padding()
            }
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
                .position(x: 207, y: 400)
        )
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
//            .environment(\.locale, .init(identifier: "it"))
            .environmentObject(NavigationRoot())
            .environmentObject(AlertClass())
    }
}

