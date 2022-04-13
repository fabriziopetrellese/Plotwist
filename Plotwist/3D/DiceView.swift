//
//  DiceView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 04/03/22.
//

import SwiftUI

struct DiceView: View {
    @Environment(\.dismiss) var backAr
    @EnvironmentObject var navigationRoot: NavigationRoot
    
    let button2: LocalizedStringKey = "button2"

    
    var body: some View {
        if navigationRoot.mode2 {
            ARDiceView()
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            backAr()
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .foregroundColor(.black)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            DiceStoryWriting()
                        } label: {
                            Text(button2)
                                .foregroundColor(.black)
                        }
                    }
                }
        } else {
            ARDiceView()
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            backAr()
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .foregroundColor(.black)
                        }
                    }
                }
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}

/*
 if navigationRoot.mode2 {
     NavigationLink {

     } label: {
         ButtonsModel(label: button2)
     }
     .padding(.bottom, 50)
 }
 */
