//
//  StoryCard.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 21/04/22.
//

import SwiftUI

struct StoryCard: View {
    let title: String
    var body: some View {
        ZStack {
            Image("storyTitleBack")
            
            Text(title)
                .font(Font.custom("Life Savers", size: 27))
                .fontWeight(.bold)
                .foregroundColor(.darkGray)
                .multilineTextAlignment(.center)
                
        }
    }
}

struct StoryCard_Previews: PreviewProvider {
    static var previews: some View {
        StoryCard(title: "[Your Title]")
    }
}
