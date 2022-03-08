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
                Text("Кинь кубик")
                    .font(Font.custom("Quick Pencil", size: 44))
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
