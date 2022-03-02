//
//  NextTurn.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 16/02/22.
//

import SwiftUI

struct NextTurn: View {
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    
    var body: some View {
        VStack {
            if storiesModel.turnNumber < 5 {
                Text("It's \(playersModel.activePlayer)'s turn, pass the phone")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Quick Pencil", size: 55))
                    .frame(width: 300, height: 200)
            } else {
                Text("""
Last turn -
\(playersModel.activePlayer), you are the last one writing!
""")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Quick Pencil", size: 55))
                    .frame(width: 300, height: 200)
            }
            
            NavigationLink {
                Storystarters()
            } label: {
                ZStack {
                    ButtonsModel(label: "I'm here!")
                    Image("OMINO1")
                        .position(x: 155, y: 2)
                }
            }
            .simultaneousGesture(TapGesture().onEnded{
                incipitsModel.nextIncipit()
            })
            .offset(x: 0.0, y: 205.0)
            .frame(width: 100, height: 100)
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct NextTurn_Previews: PreviewProvider {
    static var previews: some View {
        NextTurn()
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
            .environmentObject(StoriesModel())
    }
}
