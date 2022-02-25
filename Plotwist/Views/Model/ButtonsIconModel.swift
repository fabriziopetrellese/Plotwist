//
//  ButtonsIconModel.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 25/02/22.
//

import SwiftUI

struct ButtonsIconModel: View {
        @State var label = "test"
        @State var icon = "star"
        
        var body: some View {
            ZStack {
                Image("buttonback")
                HStack {
                    Text(label)
                        .font(Font.custom("Quick Pencil", size: 50))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .offset(x: 0, y: -4)
                }
                .padding(.horizontal, 26)
            }
            .frame(width: 218, height: 80)
            
        }
}

struct ButtonsIconModel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsIconModel()
    }
}
