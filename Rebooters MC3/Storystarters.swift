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

    
    
    var body: some View {
            ZStack {
                Image("Background")

                
                
                VStack{
                    
                    
                    HStack{
                        Text("Once upon a time...")
                            .font(Font.custom("Quick Pencil", size: 50))
                            .padding(.horizontal)
                            .frame(width: 300, height: 100, alignment: .leading)
                        Spacer()
                        
                    }
                    .position(x: 207.0, y: 200.0)
                    
                    HStack{
                        ZStack(alignment: .leading) {
                            if testo.isEmpty {
                                Text("Type here...")
                                    .font(Font.custom("Quick Pencil", size: 25))
                                    .foregroundColor(.gray)
                                    .position(x: 56, y: 20)
                            }
                            TextEditor(text: $testo)
                                .font(Font.custom("Quick Pencil", size: 25))
                                .foregroundColor(.gray)
                                .background(.clear)
                        }
                        .padding(.horizontal)
                        .frame(height: 100)
                        
                        Spacer()
                    }
                    .position(x: 207.0, y: 10.0)
                    
                    NavigationLink {
                        NextTurn()
                    } label: {
                        ButtonsModel(label: "Done")
                    }
                    .position(x: 207, y: 190.0)
                }
            }
            .ignoresSafeArea()
            .position(x: 207, y: 448)
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
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .foregroundColor(.black)
                    }
                }
                    
                
            }
        
    }
}

struct Storystarters_Previews: PreviewProvider {
    static var previews: some View {
        Storystarters()
    }
}
