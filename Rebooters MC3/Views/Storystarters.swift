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

    var body: some View {
                VStack{
                    HStack{
                        Text("Once upon a time...")
                            .font(Font.custom("Quick Pencil", size: 50))
                            .padding(.horizontal)
                            .frame(width: 300, height: 100, alignment: .leading)
                        Spacer()
                    }
                    .position(x: 207.0, y: 150.0)
                    
                    HStack{
                        ZStack(alignment: .leading) {
                            if testo.isEmpty {
                                Text("Type here...")
                                    .font(Font.custom("Quick Pencil", size: 30))
                                    .foregroundColor(.darkGray)
                                    .position(x: 62, y: 20)
                            }
                            TextEditor(text: $testo)
                                .font(Font.custom("Quick Pencil", size: 30))
                                .foregroundColor(.darkGray)
                                .background(.clear)
                        }
//                        .position(x: 207.0, y: 150.0)
                        .padding(.horizontal)
                        .frame(height: 100)
                        
                        Spacer()
                    }
//                    .position(x: 207.0, y: 150.0)

                    
                    NavigationLink {
                        NextTurn()
                    } label: {
                        ButtonsModel(label: "Done")
                    }
                    .position(x: 207, y: 210.0)
                }
            .background(
                Image("Background")
                    .ignoresSafeArea()
            )
            .navigationBarBackButtonHidden(true)
            .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    NavigationLink {
                        DiceCategories()
                        
                    } label: {
                        Image(systemName: "dice.fill")
                            .foregroundColor(.black)
                    }

                }
                
                ToolbarItem(placement: .navigationBarLeading)
                {
                    Button {
                        back1()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .keyboard)
                {
                    hideKeyboardButton()
                }
                    
                
            }
        
    }
}

struct Storystarters_Previews: PreviewProvider {
    static var previews: some View {
        Storystarters()
    }
}
