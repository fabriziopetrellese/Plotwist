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
    @EnvironmentObject var alertClass: AlertClass
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
            Text(title1)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .font(.largeTitle)
                .frame(width: 250, height: 110)
                .multilineTextAlignment(.center)
                .padding(.bottom, 56)
                .position(x: 207, y: 37)
            
//            ScrollView(showsIndicators: false) {
            GeometryReader{ geometry in
                
                VStack {
                    ZStack {
                        Image("PLAYERS")
                        TextField("", text: $playersModel.playersNames[0])
                            .placeholder(when: playersModel.playersNames[0].isEmpty) {
                                Text(player1)
                                    .font(Font.custom("Life Savers", size: 26))
                                    .padding(.horizontal, 83)
                                    .frame(width: 295, height: 60)
                                    .foregroundColor(.gray)
                            }
                            .font(Font.custom("Life Savers", size: 26))
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 300, height: 75, alignment: .center)
                    
                    ZStack {
                        Image("PLAYERS")
                        TextField("", text: $playersModel.playersNames[1])
                            .placeholder(when: playersModel.playersNames[1].isEmpty) {
                                Text(player2)
                                    .font(Font.custom("Life Savers", size: 26))
                                    .padding(.horizontal, 83)
                                    .frame(width: 295, height: 60)
                                
                                    .foregroundColor(.gray)
                            }
                            .font(Font.custom("Life Savers", size: 26))
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 300, height: 75, alignment: .center)
                    
                    if modeSelection.playerButton > 0 {
                        ZStack {
                            Image("PLAYERS")
                            TextField("", text: $playersModel.playersNames[2])
                                .placeholder(when: playersModel.playersNames[2].isEmpty) {
                                    Text(player3)
                                        .font(Font.custom("Life Savers", size: 26))
                                        .padding(.horizontal, 83)
                                        .frame(width: 295, height: 60)
                                        .foregroundColor(.gray)
                                }
                                .font(Font.custom("Life Savers", size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton > 1 {
                        ZStack {
                            Image("PLAYERS")
                            TextField("", text: $playersModel.playersNames[3])
                                .placeholder(when: playersModel.playersNames[3].isEmpty) {
                                    Text(player4)
                                        .font(Font.custom("Life Savers", size: 26))
                                        .padding(.horizontal, 83)
                                        .frame(width: 295, height: 60)
                                        .foregroundColor(.gray)
                                }
                                .font(Font.custom("Life Savers", size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton > 2 {
                        ZStack {
                            Image("PLAYERS")
                            TextField("", text: $playersModel.playersNames[4])
                                .placeholder(when: playersModel.playersNames[4].isEmpty) {
                                    Text(player5)
                                        .font(Font.custom("Life Savers", size: 26))
                                        .padding(.horizontal, 83)
                                        .frame(width: 295, height: 60)
                                        .foregroundColor(.gray)
                                }
                                .font(Font.custom("Life Savers", size: 26))
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 300, height: 75, alignment: .center)
                    }
                    
                    if modeSelection.playerButton > 3 {
                        ZStack {
                            Image("PLAYERS")
                            TextField("", text: $playersModel.playersNames[5])
                                .placeholder(when: playersModel.playersNames[5].isEmpty) {
                                    Text(player6)
                                        .font(Font.custom("Life Savers", size: 26))
                                        .padding(.horizontal, 83)
                                        .frame(width: 295, height: 60)
                                        .foregroundColor(.gray)
                                }
                                .font(Font.custom("Life Savers", size: 26))
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
                                    .font(Font.custom("Life Savers", size: 28))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, 10)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: 300, height: 75, alignment: .center)
                        }
                    }
                }
        }
//            }
            .frame(width: 300, height: 500)
            .position(x: 207, y: 110)
            

            
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
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if modeSelection.playerButton > 0 {
                        modeSelection.playerButton -= 1
                    }
                } label: {
                    Image(systemName: "trash.fill")
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
            .environmentObject(AlertClass())
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
