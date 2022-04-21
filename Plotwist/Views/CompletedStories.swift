//
//  CompletedStories.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 08/04/22.
//

import SwiftUI

struct CompletedStories: View {
    @EnvironmentObject var alertClass: AlertClass
    let lang = String(format: NSLocalizedString("language", comment: ""))
    
    @FetchRequest(
        entity: CompleteStory.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CompleteStory.storyfull, ascending: false)
        ]
    )
    var completedstories: FetchedResults<CompleteStory>
    
    var body: some View {
        if completedstories.count > 0 {
            TabView {
                ForEach(completedstories) { storiaCompleta in
                    StoryCard(story: storiaCompleta.storyfull!)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                setupAppearance()
            }
            .background(
                Image("Background")
                    .ignoresSafeArea()
            )
        } else {
            StoryCard(story: "No stories yet")
                .background(
                    Image("Background")
                        .ignoresSafeArea()
                )
        }
    }
}

struct CompletedStories_Previews: PreviewProvider {
    static var previews: some View {
        CompletedStories()
            .environmentObject(AlertClass())
    }
}

/*
 .toolbar{
     ToolbarItemGroup(placement: .navigationBarTrailing) {
         Button {
             DataController.shared.deleteStory(completeStory: storiaCompleta)
         } label: {
             Text("Delete")
         }
         Button {
             alertClass.handleSynthesizer(storiaCompleta: storiaCompleta.storyfull!, lingua: lang)
         } label: {
             Text("Play")
         }
     }
 }
 */
