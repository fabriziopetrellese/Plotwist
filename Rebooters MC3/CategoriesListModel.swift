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
                    .cornerRadius(33)
                    .foregroundColor(.listBackground)
                
                ScrollView {
                    VStack {
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                        Image("DiceCategoryButton")
                    }
                    .offset(x: 0.0, y: 25.0)
                }

            }
            

        .frame(width: 334, height: 487, alignment: .center)
        .offset(x: 0.0, y: 30.0)
    }
}

struct CategoriesListModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListModel()
    }
}
