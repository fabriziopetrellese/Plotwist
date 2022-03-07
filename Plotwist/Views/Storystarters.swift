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
    
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    @EnvironmentObject var navigationRoot: NavigationRoot
    @EnvironmentObject var alertClass: AlertClass
    @State private var story = ""
    
    let placeholder: LocalizedStringKey = "placeholder"
    let button2: LocalizedStringKey = "button2"
    
    func saveStory(story: String, index: Int) {
        storiesModel.stories[index] = story
        storiesModel.fullStory += story + " "
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(incipitsModel.currentIncipit)
                    .font(Font.custom("Quick Pencil", size: 52))
                    .padding(.horizontal)
                    .frame(width: 329, height: 100, alignment: .leading)
                Spacer()
            }
            .position(x: 207.0, y: 50)
            .frame(width: 414, height: 97)
            
            HStack {
                ZStack(alignment: .leading) {
                    if story.isEmpty {
                        Text(placeholder)
                            .font(Font.custom("Quick Pencil", size: 32))
                            .foregroundColor(.darkGray)
                            .padding(.leading, 20)
                            .padding(.bottom, 356)
                    }
                    TextEditor(text: $story)
                        .font(Font.custom("Quick Pencil", size: 33))
                        .foregroundColor(.darkGray)
                        .background(.clear)
                        .padding(.horizontal)
                }
            }
            .frame(height: 400)
            .position(x: 207, y: 195)

            
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
                saveStory(story: story, index: storiesModel.index)
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
        .blur(radius: alertClass.showingAlert ? 9 : 0)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    DiceView()
                } label: {
                    Image("rolldice")
                        .foregroundColor(.black)
                }
                
            }
            
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
        if alertClass.showingAlert == true {
            AlertView()
        }
    }
}

struct Storystarters_Previews: PreviewProvider {
    static var previews: some View {
        Storystarters()
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
            .environmentObject(StoriesModel())
            .environmentObject(AlertClass())
    }
}
