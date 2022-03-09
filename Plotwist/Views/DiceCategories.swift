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
                    .font(Font.custom("Life Savers", size: 40))
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .frame(width: 250, height: 100, alignment: .center)
                //                Spacer()
            }
            .padding(.bottom, 32)
            
            CategoriesListModel()
                        
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

/*
 Button {
     
 } label: {
     RollDiceModel()
 }
 .padding(.vertical, 32)
 */
