//
//  CategoriesButtonModel.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct CategoriesButtonModel: View {
    @State var isSelected = false
    @State var selectedButtons = 0
    
    var content : String
    
    var body: some View {
        ZStack {
            if isSelected {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 75)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 4.8, x: -2.5, y: 3)
                    RoundedRectangle(cornerRadius: 19)
                        .strokeBorder(Color.yellowSelection, lineWidth: 5)
                        .frame(width: 300, height: 75)
                        .foregroundColor(.white)
                    Text(content)
                        .font(Font.custom("Quick Pencil", size: 45))
                }.frame(width: 320, height: 96, alignment: .center)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 75)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5, x: -1.5, y: 2)
                    Text(content)
                        .font(Font.custom("Quick Pencil", size: 45))
                }.frame(width: 320, height: 96, alignment: .center)
            }
        }
        .onTapGesture {
            isSelected = !isSelected
        }
    }
}

struct CategoriesButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesButtonModel(content: "")
    }
}
