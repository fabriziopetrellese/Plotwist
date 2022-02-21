//
//  DiceStorytelling.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct DiceStorytelling: View {
    @Environment(\.dismiss) var back4
    
    var body: some View {
        ZStack {
            Text("Work in progress")
                .font(.title3)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back4()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct DiceStorytelling_Previews: PreviewProvider {
    static var previews: some View {
        DiceStorytelling()
    }
}

