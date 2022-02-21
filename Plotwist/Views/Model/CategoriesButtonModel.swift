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
    var content: String
    
    var body: some View {
        ZStack {
            let categoryButton = RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 75)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: -1.5, y: 2)
            
            let categoryButtonSelected = RoundedRectangle(cornerRadius: 19)
                .strokeBorder(Color.yellowSelection, lineWidth: 5)
                .frame(width: 300, height: 75)
                .foregroundColor(.white)
            
            
            if isSelected {
                ZStack {
                    categoryButton
                    categoryButtonSelected
                    Text(content)
                        .font(Font.custom("Quick Pencil", size: 45))
                }.frame(width: 320, height: 96, alignment: .center)
            } else {
                ZStack {
                    categoryButton
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
