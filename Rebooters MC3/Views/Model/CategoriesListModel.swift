//
//  CategoriesListModel.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 16/02/22.
//

import SwiftUI

struct CategoriesListModel: View {
    var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 334, height: 487, alignment: .center)
                    .cornerRadius(20)
                    .foregroundColor(.listBackground)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                    }
                    .padding(.vertical, 14)

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
