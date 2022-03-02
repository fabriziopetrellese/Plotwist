//
//  DiceStorytelling.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct DiceStorytelling: View {
    @EnvironmentObject var navigationRoot: NavigationRoot
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            
            Text("Select dice, get inspired and start writing")
                .multilineTextAlignment(.center)
                .font(Font.custom("Quick Pencil", size: 55))
                .frame(width: 300, height: 200)
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                ButtonsModel(label: "Select Dice")
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

