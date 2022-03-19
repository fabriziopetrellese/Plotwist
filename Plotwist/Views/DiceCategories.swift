//
//  DiceCategories.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 14/02/22.
//

import SwiftUI

struct DiceCategories: View {
    @Environment(\.dismiss) var back
    
    let diceCategories: LocalizedStringKey = "diceCategories"
    
    var body: some View {
        VStack {
            Text(diceCategories)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 28)
                .padding(.bottom, 40)
            
            CategoriesListModel()
            
            Spacer()
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
//            .environment(\.locale, .init(identifier: "ru"))
            .environmentObject(CategoriesModel())
    }
}
