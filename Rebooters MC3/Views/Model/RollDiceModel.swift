//
//  RollDiceModel.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 16/02/22.
//

import SwiftUI

struct RollDiceModel: View {
    var body: some View {
        ZStack {
            Image("rollbutton")
            
            HStack {
                Text("Roll Dices")
                    .font(Font.custom("Quick Pencil", size: 46))
                    .foregroundColor(.black)
                Image("rolldices")
                    .resizable()
                    .frame(width: 53.97, height: 43.03, alignment: .trailing)
//                    .scaledToFit()
                
            }
            

        }
    }
}

struct RollDiceModel_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceModel()
    }
}
