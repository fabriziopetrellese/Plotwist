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
    let saved: LocalizedStringKey = "saved"
    let noStories: LocalizedStringKey = "noStories"
    
    @FetchRequest(
        entity: CompleteStory.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \CompleteStory.storyfull, ascending: false)
        ]
    )
    var completedstories: FetchedResults<CompleteStory>
    
    @Environment(\.dismiss) var back10
    
    var body: some View {
        VStack {
            if completedstories.count > 0 {
                ScrollView {
                    ForEach(completedstories) { storiaCompleta in
                        NavigationLink {
                            SingleView(newTitle: storiaCompleta.storytitle!, storyDatabase: storiaCompleta)
                        } label: {
                            StoryCard(title: storiaCompleta.storytitle!)
                        }
                    }
                }
            } else {
                ZStack {
                    Image("noStoriesYet")
                    
                    Text(noStories)
                        .font(Font.custom("Life Savers", size: 27))
                        .fontWeight(.bold)
                        .foregroundColor(.darkGray)
                        .multilineTextAlignment(.center)
                        
                }
                .padding(.bottom, 25)

            }

        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .onAppear {
            AppState.shared.swipeEnabled = true
        }
        .onDisappear {
            AppState.shared.swipeEnabled = false
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(saved)
                    .font(Font.custom("Life Savers", size: 31))
                    .fontWeight(.heavy)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back10()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
        }
        
    }
}

struct CompletedStories_Previews: PreviewProvider {
    static var previews: some View {
        CompletedStories()
            .environmentObject(AlertClass())
//            .environment(\.locale, .init(identifier: "ru"))
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
