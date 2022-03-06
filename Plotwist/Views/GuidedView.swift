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
    @EnvironmentObject var modeSelection: NavigationRoot
    @Environment(\.dismiss) var back2

    let title1: LocalizedStringKey = "title1"
    let player1: LocalizedStringKey = "player1"
    let player2: LocalizedStringKey = "player2"
    let player3: LocalizedStringKey = "player3"
    let player4: LocalizedStringKey = "player4"
    let player5: LocalizedStringKey = "player5"
    let player6: LocalizedStringKey = "player6"
    let button1: LocalizedStringKey = "button1"
    let addButton: LocalizedStringKey = "addButton"
    
    var body: some View {

        VStack {
            ZStack {
                Text(title1)
                    .font(Font.custom("Quick Pencil", size: 70))
                    .font(.largeTitle)
                    .frame(width: 300, height: 110)
                    .multilineTextAlignment(.center)
                
                Image("FALLIN")
                    .offset(x: -40, y: 60)
            }
            .padding(.bottom, 56)
            .position(x: 207, y: 37)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        Image("PLAYERS")
                        TextField(player1, text: $playersModel.playersNames[0])
                            .font(.system(size: 26))
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 300, height: 75, alignment: .center)
                    
                    ZStack {
                        Image("PLAYERS")
                        TextField(player2, text: $playersModel.playersNames[1])
                            .font(.system(size: 26))
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 300, height: 75, alignment: .center)
                    
                    if modeSelection.playerButton > 0 {
                        ZStack {
                            Image("PLAYERS")
                            TextField(player3, text: $playersModel.playersNames[2])
                                .font(.system(size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton > 1 {
                        ZStack {
                            Image("PLAYERS")
                            TextField(player4, text: $playersModel.playersNames[3])
                                .font(.system(size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton > 2 {
                        ZStack {
                            Image("PLAYERS")
                            TextField(player5, text: $playersModel.playersNames[4])
                                .font(.system(size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton > 3 {
                        ZStack {
                            Image("PLAYERS")
                            TextField(player6, text: $playersModel.playersNames[5])
                                .font(.system(size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton < 4 {
                        Button {
                            modeSelection.playerButton += 1
                        } label: {
                            ZStack {
                                Image("PLAYERS")
                                Text(addButton)
                                    .font(.system(size: 26))
                                    .padding(.horizontal, 20)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: 300, height: 75, alignment: .center)
                        }
                    }
                }
            }
            .frame(width: 300, height: 500)
            .position(x: 207, y: 127)
    
            if playersModel.playersNames[0] != "" && playersModel.playersNames[0] != " " && playersModel.playersNames[1] != "" && playersModel.playersNames[1] != " " {
                NavigationLink {
                    if modeSelection.mode1 == true {
                        Storystarters()
                    }
                    if modeSelection.mode2 == true {
                        DiceStorytelling()
                    }
                } label: {
                    ButtonsModel(label: button1)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    playersModel.setUpPlayers()
                    incipitsModel.nextIncipit()
                })
                .padding(36)
                .position(x: 202, y: 195)
            } else {
                ZStack {
                    
                }
                .frame(width: 218, height: 80)
                .padding(36)
                .position(x: 202, y: 195)
            }
        }
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
                    modeSelection.playerButton = 0
                    modeSelection.mode1 = false
                    modeSelection.mode2 = false
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
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
            .environmentObject(NavigationRoot())
    }
}
