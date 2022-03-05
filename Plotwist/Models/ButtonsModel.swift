//
//  ButtonsModel.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 16/02/22.
//

import SwiftUI

struct ButtonsModel: View {
    @State var label: LocalizedStringKey = "test"
    
    var body: some View {
        ZStack {
            Image("buttonback")
            HStack {
                Text(label)
                    .font(Font.custom("Quick Pencil", size: 45.5))
                    .foregroundColor(.black)
            }.padding(.horizontal, 30)
        }
        
    }
}

struct ButtonsModel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsModel()
    }
}
