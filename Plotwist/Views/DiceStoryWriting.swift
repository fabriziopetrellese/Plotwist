//
//  DiceStoryWriting.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 09/03/22.
//

import SwiftUI

struct DiceStoryWriting: View {
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    @EnvironmentObject var navigationRoot: NavigationRoot
    @EnvironmentObject var alertClass: AlertClass
    @State private var story = ""
    
    let placeholder: LocalizedStringKey = "placeholder"
    let button2: LocalizedStringKey = "button2"
    
    func saveDiceStory(story: String, index: Int) {
        storiesModel.stories[index] = story
        storiesModel.fullStory += story + ".\n"
    }
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("chicken right now, please")
                    .font(Font.custom("Life Savers", size: 33))
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .frame(width: 272, height: 100, alignment: .leading)
                Spacer()
            }
            .position(x: 207.0, y: 50)
            .frame(width: 414, height: 97)
            
            HStack {
                ZStack(alignment: .leading) {
                    if story.isEmpty {
                        Text(placeholder)
                            .font(Font.custom("Life Savers", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.darkGray)
                            .padding(.leading, 20)
                            .padding(.bottom, 356)
                    }
                    TextEditor(text: $story)
                        .font(Font.custom("Life Savers", size: 24).weight(.bold))
                        .foregroundColor(.darkGray)
                        .background(.clear)
                        .padding(.horizontal)
                }
            }
            .frame(height: 400)
            .position(x: 207, y: 195)
            
            Spacer()
            NavigationLink {
                if storiesModel.index < 6 {
                    NextTurn()
                } else {
                    SiriView()
                }
            } label: {
                if story != "" {
                    ButtonsModel(label: button2)
                } else {
                    ZStack {
                    }
                }
            }
            .simultaneousGesture(TapGesture().onEnded{
                if storiesModel.index < 6 {
                    playersModel.nextPlayer()
                }
                saveDiceStory(story: story, index: storiesModel.index)
                storiesModel.index += 1
                storiesModel.turnNumber += 1
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
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    alertClass.showingAlert = true
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                }
            }
            
            ToolbarItem(placement: .keyboard) {
                hideKeyboardButton()
            }
        }
        .blur(radius: alertClass.showingAlert ? 12 : 0)
        if alertClass.showingAlert == true {
            AlertView()
        }
    }
}

struct DiceStoryWriting_Previews: PreviewProvider {
    static var previews: some View {
        DiceStoryWriting()
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
            .environmentObject(StoriesModel())
            .environmentObject(AlertClass())
    }
}
