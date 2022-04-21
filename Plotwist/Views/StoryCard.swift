//
//  StoryCard.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 21/04/22.
//

import SwiftUI

struct StoryCard: View {
    @State var story = "Hi"
    var body: some View {
        VStack {
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    Text(story)
                        .font(Font.custom("Life Savers", size: 28))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.darkGray)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width)
                }
            }
            .padding(.horizontal, 24)
            .frame(height: 550)
            Spacer()
        }
    }
}

struct StoryCard_Previews: PreviewProvider {
    static var previews: some View {
        StoryCard()
    }
}
