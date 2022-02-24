//
//  Storystarters.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 14/02/22.
//

import SwiftUI

struct Storystarters: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    @State private var testo: String = ""
    @Environment(\.dismiss) var back1
    
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    
    var body: some View {
        VStack {
            HStack {
                Text(incipitsModel.currentIncipit)
                    .font(Font.custom("Quick Pencil", size: 50))
                    .padding(.horizontal)
                    .frame(width: 300, height: 100, alignment: .leading)
                Spacer()
            }
            .position(x: 207.0, y: 50)
            .frame(width: 414, height: 97)
            
            HStack {
                ZStack(alignment: .leading) {
                    if testo.isEmpty {
                        Text("Type here...")
                            .font(Font.custom("Quick Pencil", size: 30))
                            .foregroundColor(.darkGray)
                            .padding(.horizontal)
                            .position(x: 78, y: 20)
                    }
                    TextEditor(text: $testo)
                        .font(Font.custom("Quick Pencil", size: 30))
                        .foregroundColor(.darkGray)
                        .background(.clear)
                        .padding(.horizontal)
                }
            }
            .frame(height: 400)
            .position(x: 207, y: 195)
//            Spacer()
                NavigationLink {
                    NextTurn()
                } label: {
                    ButtonsModel(label: "Done")
                }
                .simultaneousGesture(TapGesture().onEnded{
                    playersModel.nextPlayer()
                })
                .position(x: 207, y: 260.0)
            Spacer()
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
                .position(x: 207, y: 400)
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    DiceCategories()
                } label: {
                    Image(systemName: "dice.fill")
                        .foregroundColor(.black)
                }
                
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back1()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
            
            ToolbarItem(placement: .keyboard) {
                hideKeyboardButton()
            }
        }
        //if playersModel.prova == 5 {
            //NavigationLink {
              //  ProvaView()
            //} label: {
                
          //  }
        //}
    }
}

struct Storystarters_Previews: PreviewProvider {
    static var previews: some View {
        Storystarters()
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
    }
}
