//
//  GuidedView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct GuidedView: View {
    @State private var newPlayer = 2
    
    var body: some View {
        VStack {
            Text("""
 Select
players
""")
                .font(Font.custom("Quick Pencil", size: 70))
                .font(.largeTitle)
                .bold()
                .offset(x: -2, y: 0)
            
            Image("FALLIN")
                .offset(x: -39, y: -44)
            Button {
                
            } label: {
                ZStack {
                    Image("PLAYERS")
                    Text("Player 1")
                        .foregroundColor(.black)
                        .font(.system(size: 27))
                }
            }
            Button {
                
            } label: {
                ZStack {
                    Image("PLAYERS")
                    Text("Player 2")
                        .foregroundColor(.black)
                        .font(.system(size: 27))
                }
            }
            Button {
                
            } label: {
                ZStack {
                    Image("PLAYERS")
                    Text("Add new player")
                        .foregroundColor(.black)
                        .font(.system(size: 27))
                }
            }
            Spacer()
            NavigationLink {
                Storystarters()
                
            } label: {
                ButtonsModel(label: "Ready")
            }
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
    }
}

struct GuidedView_Previews: PreviewProvider {
    static var previews: some View {
        GuidedView()
    }
}
