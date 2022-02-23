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
    

    
    var body: some View {
        VStack {
            Text("It's \(playersModel.activePlayer)'s turn, pass the phone")
                .multilineTextAlignment(.center)
                .font(Font.custom("Quick Pencil", size: 55))
                .frame(width: 300, height: 200)
            
            
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
            .offset(x: 0.0, y: 195.0)
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
    }
}
