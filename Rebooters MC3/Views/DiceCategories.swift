//
//  DiceCategories.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 14/02/22.
//

import SwiftUI

struct DiceCategories: View {
    
    @Environment(\.dismiss) var back
    
    var body: some View {
        VStack {
            HStack {
                Text("Select dice categories")
                    .font(Font.custom("Quick Pencil", size: 50))
                    .padding(.horizontal)
                    .frame(width: 400, height: 100, alignment: .center)
                Spacer()
                
            }
            .offset(x: 10.0, y: 20.0)
            
            CategoriesListModel()
            
            Button {
                
            } label: {
                RollDiceModel()
            }
            .offset(x: -10.0, y: 50.0)
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back()
                    
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
                
            }
            
        }
    }
}

struct DiceCategories_Previews: PreviewProvider {
    static var previews: some View {
        DiceCategories()
    }
}
