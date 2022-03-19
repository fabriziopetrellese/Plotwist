//
//  SelectPlayersNumberView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 12/03/22.
//

import SwiftUI

struct SelectPlayersNumberView: View {
    @EnvironmentObject var playersModel: PlayersModel
    let addButton: LocalizedStringKey = "addButton"
    
    var body: some View {
        VStack {
            if playersModel.playerButton < 4 {
                Button {
                    playersModel.playerButton += 1
                } label: {
                    ZStack {
                        Image("PLAYERS")
                        Text(addButton)
                            .font(Font.custom("Life Savers", size: 28))
                            .fontWeight(.heavy)
                            .padding(.horizontal, 10)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
    }
}

struct SelectPlayersNumberView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPlayersNumberView()
            .environmentObject(PlayersModel())
    }
}




// + AND - buttons
/*
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
 */
