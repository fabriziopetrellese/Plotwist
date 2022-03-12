//
//  SelectPlayersNumberView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 12/03/22.
//

import SwiftUI

struct SelectPlayersNumberView: View {
    @EnvironmentObject var navigationRoot: NavigationRoot
    @Environment(\.dismiss) var backNew
    
    let button2: LocalizedStringKey = "button2"
    let numberSelection: LocalizedStringKey = "numberSelection"
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text(numberSelection)
                .font(Font.custom("Life Savers", size: 36))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
                
            
            Text("\(navigationRoot.playerButton + 2)")
                .font(Font.custom("Life Savers", size: 36))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            ZStack {
                Image("PLAYERS")
                
                Text("|")
                    .font(Font.custom("Life Savers", size: 40))
                
                HStack {
                    Button {
                        if navigationRoot.playerButton < 4 {
                            navigationRoot.playerButton += 1
                        }
                    } label: {
                        Image(systemName: "plus")
                            .frame(width: 149, height: 72)
                        
                    }
                    .frame(width: 149, height: 72)
                    
                    Spacer()
                    
                    Button {
                        if navigationRoot.playerButton > 0 {
                            navigationRoot.playerButton -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .frame(width: 149, height: 72)
                    }
                    .frame(width: 149, height: 72)
                }
                .frame(width: 300, height: 72)
            }
            
            Spacer()
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    navigationRoot.playerButton = 0
                    navigationRoot.mode1 = false
                    navigationRoot.mode2 = false
                    backNew()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    GuidedView()
                } label: {
                    Text("button2")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct SelectPlayersNumberView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPlayersNumberView()
            .environmentObject(NavigationRoot())
    }
}
