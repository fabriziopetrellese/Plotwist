//
//  Storystarters.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 14/02/22.
//

import SwiftUI

struct Storystarters: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    @Environment(\.dismiss) var back1
    
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    @State var story = ""
    
    
    func saveStory(story: String, index: Int) {
        storiesModel.stories[index] = story
        storiesModel.fullStory += story + " "
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(incipitsModel.currentIncipit)
                    .font(Font.custom("Quick Pencil", size: 50))
                    .padding(.horizontal)
                    .frame(width: 300, height: 100, alignment: .leading)
                Spacer()
            }
            .position(x: 207.0, y: 50)
            .frame(width: 414, height: 97)
            
            HStack {
                ZStack(alignment: .leading) {
                    if story.isEmpty {
                        Text("Type here...")
                            .font(Font.custom("Quick Pencil", size: 30))
                            .foregroundColor(.darkGray)
                            .padding(.horizontal)
                            .position(x: 78, y: 20)
                    }
                    TextEditor(text: $story)
                        .font(Font.custom("Quick Pencil", size: 30))
                        .foregroundColor(.darkGray)
                        .background(.clear)
                        .padding(.horizontal)
                }
            }
            .frame(height: 400)
            .position(x: 207, y: 195)
//            Spacer()
                NavigationLink {
                    if storiesModel.index < 6 {
                        NextTurn()
                    } else {
                        SiriView()
                    }
                } label: {
                    ButtonsModel(label: "Done")
                }
                .simultaneousGesture(TapGesture().onEnded{
                    if storiesModel.index < 6 {
                        playersModel.nextPlayer()
                    }
                    saveStory(story: story, index: storiesModel.index)
                    storiesModel.index += 1
                    print(storiesModel.index)
                })
                .position(x: 207, y: 260.0)
            Spacer()
        }
        .background(
            Image("Background")
                .ignoresSafeArea()
                .position(x: 207, y: 400)
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    DiceCategories()
                } label: {
                    Image(systemName: "dice.fill")
                        .foregroundColor(.black)
                }
                
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    back1()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.black)
                }
            }
            
            ToolbarItem(placement: .keyboard) {
                hideKeyboardButton()
            }
        }
    }
}

struct Storystarters_Previews: PreviewProvider {
    static var previews: some View {
        Storystarters()
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
    }
}



