//
//  CategoriesListModel.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 16/02/22.


import SwiftUI
import Foundation

struct CategoriesListModel: View {
    @EnvironmentObject var categoriesModel: CategoriesModel
    let categoriesNumber = 6
    
    var body: some View {
        ZStack {
            Rectangle()
//                .frame(width: 334, height: 487, alignment: .center)
                .cornerRadius(20)
                .foregroundColor(.listBackground)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(categoriesModel.categories[0..<categoriesNumber]) { category in
                        CategoriesButtonModel(content: category.cat)
                    }
                }
                .padding(.vertical, 17)
            }
//            .frame(width: 334, height: 487, alignment: .center)
        }
//        .frame(width: 334, height: 487, alignment: .center)
        .padding(.horizontal)
    }
}

struct CategoriesListModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListModel()
            .environmentObject(CategoriesModel())
    }
}

