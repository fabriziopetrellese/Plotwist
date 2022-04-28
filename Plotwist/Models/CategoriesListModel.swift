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
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(.listBackground)
                    .opacity(0.32)
                    .frame(width: 0.9 * UIScreen.main.bounds.width, height: 0.72 * UIScreen.main.bounds.height)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(categoriesModel.categories[0..<categoriesNumber]) { category in
                            CategoriesButtonModel(content: category.cat)
                        }
//                        .frame(width: 0.9 * UIScreen.main.bounds.width, height: 0.106 * UIScreen.main.bounds.height)
                    }
                    .padding(.vertical, 17)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoriesListModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListModel()
            .environmentObject(CategoriesModel())
    }
}

