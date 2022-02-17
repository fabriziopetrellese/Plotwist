//
//  GuidedView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct GuidedView: View {
    @State var playerName: String = ""
    @State var players = 0
    var playerButtons = ["Add a friend", "Add a friend", "Add one more"]
    
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
//            Button {
//                
//            } label: {
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 1", text: $playerName)
                        .font(.system(size: 27))
                        .offset(x: 160, y: 0)
                }
//            }

            ZStack {
                Image("PLAYERS")
                TextField("Player 2", text: $playerName)
                    .font(.system(size: 27))
                    .padding(.horizontal, 160)
            }
                ForEach(playerButtons[0..<players], id: \.self) { playerButton in
                    newPlayer()

                }
            add
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
    var add: some View {
        Button {
            if players < 3 {
                players += 1
            }
        } label: {
            ZStack {
                newPlayer()
            }
        }
    }
}

struct GuidedView_Previews: PreviewProvider {
    static var previews: some View {
        GuidedView()
    }
}
