//
//  CompletedStories.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 08/04/22.
//

import SwiftUI

struct CompletedStories: View {
    
    @FetchRequest(
        entity: CompleteStory.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CompleteStory.storyfull, ascending: false)
        ]
    )
    var completedstories: FetchedResults<CompleteStory>
    
    var body: some View {
        if completedstories.count > 0 {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(completedstories) { storiaCompleta in
                        Text(storiaCompleta.storyfull!)
                            .frame(width: 400, height: 200)
            

                    }

                    

                }
                .padding()
            }

        } else {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct CompletedStories_Previews: PreviewProvider {
    static var previews: some View {
        CompletedStories()
    }
}
