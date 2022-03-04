//
//  DiceStorytelling.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct DiceStorytelling: View {
//    @StateObject var placementSettings = PlacementSettings()
//    @StateObject var sessionSettings = SessionSettings()
    @EnvironmentObject var navigationRoot: NavigationRoot
    @State private var showingAlert = false
    let diceTitle: LocalizedStringKey = "diceTitle"
    let selectDice: LocalizedStringKey = "selectDice"
    
    var body: some View {
        VStack {
            
            Text(diceTitle)
                .multilineTextAlignment(.center)
                .font(Font.custom("Quick Pencil", size: 55))
                .frame(width: 300, height: 220)
            
            Spacer()
            
            NavigationLink {
                DiceView()
                //                    .environmentObject(placementSettings)
                //                    .environmentObject(sessionSettings)
            } label: {
                ButtonsModel(label: selectDice)
            }
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            navigationRoot.mode2 = false
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    showingAlert = true
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                }
                .alert("Do you want to leave the game?", isPresented: $showingAlert) {
                    Button ("Yes", role: .destructive) {
                        navigationRoot.mode2 = false
                        navigationRoot.backToRoot = true
                        navigationRoot.playerButton = 0
                    }
                    Button ("No", role: .cancel) {}
                } message: {
                    Text("You will go back to the main menu")
                }
            }
        }
    }
}

struct DiceStorytelling_Previews: PreviewProvider {
    static var previews: some View {
        DiceStorytelling()
            .environmentObject(NavigationRoot())
    }
}

