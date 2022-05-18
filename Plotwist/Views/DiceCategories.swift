//
//  DiceCategories.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 14/02/22.
//

import SwiftUI

struct DiceCategories: View {
    @Environment(\.dismiss) var back
    
    @EnvironmentObject var navigationRoot: NavigationRoot
    
    let diceCategories: LocalizedStringKey = "diceCategories"
    
    var body: some View {
        VStack {
            Text(diceCategories)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 28)
                .frame(width: 1 * UIScreen.main.bounds.width, height: 0.15 * UIScreen.main.bounds.height)
//                .padding(.bottom)
            
            CategoriesListModel()
                .frame(width: 1 * UIScreen.main.bounds.width, height: 0.45 * UIScreen.main.bounds.height)
//                .padding(.bottom)
            
//            Spacer()
        }
        .padding(.bottom, 270)
        .background(
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .onAppear {
            AppState.shared.swipeEnabled = true
        }
        .onDisappear {
            AppState.shared.swipeEnabled = false
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if (navigationRoot.mode1) {
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
}

struct DiceCategories_Previews: PreviewProvider {
    static var previews: some View {
        DiceCategories()
//            .environment(\.locale, .init(identifier: "it"))
            .environmentObject(CategoriesModel())
            .environmentObject(NavigationRoot())
    }
}
