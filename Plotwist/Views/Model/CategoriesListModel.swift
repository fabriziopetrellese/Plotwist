//
//  CategoriesListModel.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 16/02/22.
//

import SwiftUI

struct CategoriesListModel: View {

    @State var categoriesNumber = 7
    var categories = ["Fantasy", "Videogames", "Mistery", "Animals", "Elements", "Sport", "Cooking"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 334, height: 487, alignment: .center)
                .cornerRadius(20)
                .foregroundColor(.listBackground)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(categories[0..<categoriesNumber], id: \.self) { category in
                        CategoriesButtonModel(content: category)
                    }
                }
                .padding(.vertical, 17)
            }
            .frame(width: 334, height: 487, alignment: .center)
        }
        .frame(width: 334, height: 487, alignment: .center)
    }
}

struct CategoriesListModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListModel()
    }
}
