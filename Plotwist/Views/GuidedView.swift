//
//  GuidedView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct GuidedView: View {
    @EnvironmentObject var playersModel: PlayersModel
    
    @State var name1: String = ""
    @State var name2: String = ""
    @State var name3: String = ""
    @State var name4: String = ""
    @State var name5: String = ""
    @State var name6: String = ""
        
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
                    TextField("Player 1", text: $playersModel.name1)
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 2", text: $playersModel.name2)
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 3", text: $name3)
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 4", text: $name4)
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 5", text: $name5)
                        .font(.system(size: 26))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 75, alignment: .center)
                
                ZStack {
                    Image("PLAYERS")
                    TextField("Player 6", text: $name6)
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
                    print("the second name is: ")
                    print(playersModel.name1)
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
