//
//  DiceView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 04/03/22.
//

import SwiftUI

struct DiceView: View {
    @Environment(\.dismiss) var backAr
    
    var body: some View {
        
        ZStack {
            RealityKitView()
            
            
            NavigationLink {
                DiceStoryWriting()
            } label: {
                ButtonsModel(label: "I feel inspired")
            }
            .position(x: 207, y: 800)
            
            
        }
        
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button {
//                    backAr()
//                } label: {
//                    Image(systemName: "arrowshape.turn.up.backward.fill")
//                        .foregroundColor(.black)
//                }
//            }
//        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
