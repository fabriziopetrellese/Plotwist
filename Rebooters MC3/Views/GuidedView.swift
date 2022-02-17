//
//  GuidedView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct GuidedView: View {
    @State var playerName1: String = ""
    @State var playerName2: String = ""
    @State var playerName3: String = ""
    @State var playerName4: String = ""
    @State var playerName5: String = ""
    @State var playerName6: String = ""
    
    var body: some View {

            ZStack {
                Image("BACK")
                    .ignoresSafeArea()
                
                
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
                    .position(x: 207, y: 120)
                    
                    
                    ScrollView {
                      
                            ZStack {
                                Image("PLAYERS")
                                TextField("Player 1", text: $playerName1)
                                    .font(.system(size: 26))
                                    .padding(.leading)
                            }
                            .frame(width: 300, height: 72, alignment: .center)
                            
                            ZStack {
                                Image("PLAYERS")
                                TextField("Player 2", text: $playerName2)
                                    .font(.system(size: 26))
                                    .padding(.leading)
                            }
                            .frame(width: 300, height: 72, alignment: .center)
                            
                            ZStack {
                                Image("PLAYERS")
                                TextField("Player 3", text: $playerName3)
                                    .font(.system(size: 26))
                                    .padding(.leading)
                            }
                            .frame(width: 300, height: 72, alignment: .center)
                            
                            ZStack {
                                Image("PLAYERS")
                                TextField("Player 4", text: $playerName4)
                                    .font(.system(size: 26))
                                    .padding(.leading)
                            }
                            .frame(width: 300, height: 72, alignment: .center)
                            
                            ZStack {
                                Image("PLAYERS")
                                TextField("Player 5", text: $playerName5)
                                    .font(.system(size: 26))
                                    .padding(.leading)
                            }
                            .frame(width: 300, height: 72, alignment: .center)
                            
                            ZStack {
                                Image("PLAYERS")
                                TextField("Player 6", text: $playerName6)
                                    .font(.system(size: 26))
                                    .padding(.leading)
                            }
                            .frame(width: 300, height: 72, alignment: .center)
                            
                        
                    }
                    .frame(width: 300, height: 500)
                    .position(x: 207, y: 160)
                    
                    NavigationLink {
                        Storystarters()
                    } label: {
                        ButtonsModel(label: "Ready")
                    }
                    .padding(36)
                    .position(x: 207, y: 150)
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard)
                {
                    hideKeyboardButton()
                }
            }

    }
}

struct GuidedView_Previews: PreviewProvider {
    static var previews: some View {
        GuidedView()
    }
}
