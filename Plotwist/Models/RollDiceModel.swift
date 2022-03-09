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
                Text("Roll Dice")
                    .font(Font.custom("Life Savers", size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image("rolldice")
                    .resizable()
                    .frame(width: 53.97, height: 43.03, alignment: .trailing)
            }
        }
    }
}

struct RollDiceModel_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceModel()
    }
}
