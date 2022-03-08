//
//  ButtonsModel.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 16/02/22.
//

import SwiftUI

struct ButtonsModel: View {
    @State var label: LocalizedStringKey = ""
    
    var body: some View {
        ZStack {
            Image("buttonback")
            HStack {
                Text("Avvia")
                    .font(Font.custom("Life Savers", size: 31))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(width: 218, height: 80)
            }
        }
        
    }
}

struct ButtonsModel_Previews: PreviewProvider {
    static var previews: some View {
            ButtonsModel()
    }
}
