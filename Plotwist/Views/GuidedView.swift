//
//  GuidedView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct GuidedView: View {
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @Environment(\.dismiss) var back2
    

    var body: some View {
        
        VStack {
            ZStack {
                Text("Select players")
                    .font(Font.custom("Quick Pencil", size: 70))
                    .font(.largeTitle)
                    .bold()
                    .frame(width: 300, height: 110)
                    .multilineTextAlignment(.center)
                
                
                Image("FALLIN")
                    .offset(x: -40, y: 60)
            }
            .padding(.bottom, 56)
            .position(x: 207, y: 37)
            
            
            ScrollView {
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 1", text: $playersModel.players[0])
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 2", text: $playersModel.players[1])
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 3", text: $playersModel.players[2])
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 4", text: $playersModel.players[3])
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 5", text: $playersModel.players[4])
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 6", text: $playersModel.players[5])
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
            }
            .frame(width: 300, height: 500)
            .position(x: 207, y: 127)
            
            NavigationLink {
                Storystarters()
            } label: {
                ButtonsModel(label: "Ready")
            }
            .simultaneousGesture(TapGesture().onEnded{
                incipitsModel.nextIncipit()
            })
            .padding(36)
            .position(x: 202, y: 195)
        }
//        .environmentObject(playersModel)
        .background(
            Image("BACK")
                .ignoresSafeArea()
                .position(x: 207, y: 400)
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                hideKeyboardButton()
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back2()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
        }
        
    }
}

struct GuidedView_Previews: PreviewProvider {
    static var previews: some View {
        GuidedView()
    }
}
