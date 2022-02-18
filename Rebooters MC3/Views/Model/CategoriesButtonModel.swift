//
//  CategoriesButtonModel.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct CategoriesButtonModel: View {
    var content : String
    
    var body: some View {
        ZStack {
            Image("DiceCategoryButton")
            Text(content)
                .font(Font.custom("Quick Pencil", size: 45))
        }
    }
}

struct CategoriesButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesButtonModel(content: "")
    }
}
