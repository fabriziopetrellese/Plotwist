//
//  CategoriesButtonModel.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 18/02/22.
//

import SwiftUI

struct CategoriesButtonModel: View {
    var content: LocalizedStringKey
    
    @EnvironmentObject var categoriesModel: CategoriesModel
    
    var body: some View {
        ZStack {
            let categoryButton = RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 75)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: -1.5, y: 2)
            
            NavigationLink {
                DiceView()
            } label: {
                ZStack {
                    categoryButton
                    Text(content)
                        .font(Font.custom("Life Savers", size: 40))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                .frame(width: 320, height: 96, alignment: .center)
            }
            .simultaneousGesture(TapGesture().onEnded{
                categoriesModel.selectCategory(category: content)
            })
    
        }
        
    }
}

struct CategoriesButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesButtonModel(content: "")
            .environmentObject(CategoriesModel())
    }
}

/*
 struct CategoriesButtonModel: View {
     @State private var isSelected = false
     @State private var selectedButtons = 0
     var content: String
     
     var body: some View {
         ZStack {
             let categoryButton = RoundedRectangle(cornerRadius: 20)
                 .frame(width: 300, height: 75)
                 .foregroundColor(.white)
                 .shadow(color: .black, radius: 5, x: -1.5, y: 2)
             
             let categoryButtonSelected = RoundedRectangle(cornerRadius: 19)
                 .strokeBorder(Color.yellowSelection, lineWidth: 4)
                 .frame(width: 300, height: 75)
                 .foregroundColor(.white)
             
             
             if isSelected {
                 ZStack {
                     categoryButton
                     categoryButtonSelected
                     Text(content)
                         .font(Font.custom("Life Savers", size: 40))
                         .fontWeight(.heavy)
                 }.frame(width: 320, height: 96, alignment: .center)
             } else {
                 ZStack {
                     categoryButton
                     Text(content)
                         .font(Font.custom("Life Savers", size: 40))
                         .fontWeight(.heavy)
                 }.frame(width: 320, height: 96, alignment: .center)
             }
         }
         .onTapGesture {
             isSelected = !isSelected
         }
         
     }
 }
 
 */
