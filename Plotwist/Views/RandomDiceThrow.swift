//
//  RandomDiceThrow.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct RandomDiceThrow: View {
    @Environment(\.dismiss) var back5
    
    var body: some View {
        VStack {
            Text("Work in progress")
                .font(.title3)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back5()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct RandomDiceThrow_Previews: PreviewProvider {
    static var previews: some View {
        RandomDiceThrow()
    }
}
