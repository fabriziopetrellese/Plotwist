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
    
    @State private var showingAlert = false
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    @EnvironmentObject var navigationRoot: NavigationRoot
    @State private var story = ""
    
    
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
                    .frame(width: 300, height: 100, alignment: .leading)
                Spacer()
            }
            .position(x: 207.0, y: 50)
            .frame(width: 414, height: 97)
            
            HStack {
                ZStack(alignment: .leading) {
                    if story.isEmpty {
                        Text("Type here...")
                            .font(Font.custom("Quick Pencil", size: 32))
                            .foregroundColor(.darkGray)
                            .padding(.horizontal)
                            .position(x: 78, y: 20)
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
                ButtonsModel(label: "Done")
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    DiceCategories()
                } label: {
                    Image("rolldice")
                        .foregroundColor(.black)
                }
                
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    showingAlert = true
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                }
                .alert("Do you want to leave the game?", isPresented: $showingAlert) {
                    Button ("Yes", role: .destructive) {
                        navigationRoot.mode1 = false
                        navigationRoot.backToRoot = true
                    }
                    Button ("No", role: .cancel) {}
                } message: {
                    Text("You will go back to the main menu")
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
            .environmentObject(StoriesModel())
    }
}



