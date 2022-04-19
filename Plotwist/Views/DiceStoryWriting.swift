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
    let doneKeyboard: LocalizedStringKey = "doneKeyboard"
    
    let firstTurnMessage: LocalizedStringKey = "firstTurnMessage"

    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            HStack {
                if storiesModel.index == 0 {
                    Text(firstTurnMessage)
                        .font(Font.custom("Life Savers", size: 30))
                        .fontWeight(.heavy)
    //                    .padding(.trailing, 121)
                        .padding(.leading)

                } else {
                    Text("..." + storiesModel.lastFourWords())
                        .font(Font.custom("Life Savers", size: 30))
                        .fontWeight(.heavy)
    //                    .padding(.trailing, 121)
                        .padding(.leading)
                }

                Spacer()
            }
            ZStack(alignment: .leading) {
                    GeometryReader { geo in
                        if story.isEmpty {
                            Text(placeholder)
                                .font(Font.custom("Life Savers", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.darkGray)
                                .padding(.leading, 20)
                                .offset(y: 7)
                        }
                        TextEditor(text: $story)
                            .font(Font.custom("Life Savers", size: 24).weight(.bold))
                            .foregroundColor(.darkGray)
                            .background(.clear)
                            .padding(.horizontal)
                            .frame(height: 200)
                    }
            }
            NavigationLink {
                if storiesModel.index < 6 {
                    NextTurn()
                } else {
                    SiriView()
                }
            } label: {
                story != "" ? ButtonsModel(label: button2) : nil
            }
            .padding(.bottom, 25)
            .simultaneousGesture(TapGesture().onEnded{
                if storiesModel.index < 6 {
                    playersModel.nextPlayer()
                }
                storiesModel.nextSecondMode(storia: story)
            })
        }
        .ignoresSafeArea(.keyboard)
        .background(
            Image("Background")
                .ignoresSafeArea()
                .position(x: 207, y: 400)
                .onTapGesture {
                    dismissKeyboard()
                }
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
                Button {
                    hideKeyboard()
                } label: {
                    Text(doneKeyboard)
                        .fontWeight(.bold)
                }
            }
        }
        .blur(radius: alertClass.showingAlert ? 12 : 0)
        alertClass.showingAlert == true ? AlertView() : nil
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

