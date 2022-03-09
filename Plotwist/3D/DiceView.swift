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
    var diceName: String
    
    var body: some View {
        
        ZStack {
            RealityKitView()
            
            if navigationRoot.mode2 {
                NavigationLink {
                    DiceStoryWriting()
                } label: {
                    ButtonsModel(label: button2)
                }
                .position(x: 207, y: 800)
            }
        }
        
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

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceName: "")
    }
}
