//
//  Storystarters.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 14/02/22.
//

import SwiftUI

struct Storystarters: View {
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    @EnvironmentObject var navigationRoot: NavigationRoot
    @EnvironmentObject var alertClass: AlertClass
    @State private var story = ""
    
    let placeholder: LocalizedStringKey = "placeholder"
    let button2: LocalizedStringKey = "button2"
    
    func saveStory(story: String, incipit: String, index: Int) {
        storiesModel.stories[index] = story
        storiesModel.fullStory += incipit + " " + story + ".\n"
    }
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text(incipitsModel.currentIncipit)
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
                        .font(Font.custom("Life Savers", size: 24))
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
                saveStory(story: story, incipit: incipitsModel.currentIncipit, index: storiesModel.index)
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
        .blur(radius: alertClass.showingAlert ? 12 : 0)
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




