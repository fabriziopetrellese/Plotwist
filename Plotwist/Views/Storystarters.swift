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
    
//    @State var timeRemaining = 5
    @State private var story = ""
//    @State private var shouldNavigate = false
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let placeholder: LocalizedStringKey = "placeholder"
    let button2: LocalizedStringKey = "button2"
    let doneKeyboard: LocalizedStringKey = "doneKeyboard"
        
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(incipitsModel.currentIncipit)
                    .font(Font.custom("Life Savers", size: 33))
                    .fontWeight(.heavy)
                    .padding(.trailing, 121)
                    .padding(.leading)
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
//                        .frame(height: 200)
                        .frame(width: 1 * UIScreen.main.bounds.width, height: 0.235 * UIScreen.main.bounds.height)
                }
            }
            //automatically change view here
            NavigationLink(/*isActive: $shouldNavigate*/) {
                if storiesModel.index < 6 {
                    NextTurn()
                } else {
                    ReunitedView()
                }
            } label: {
                story != "" ? ButtonsModel(label: button2) : nil
            }
            .padding(.bottom, 25)
            .simultaneousGesture(TapGesture().onEnded{
                if storiesModel.index < 6 {
                    playersModel.nextPlayer()
                }
                storiesModel.nextFirstMode(storia: story, inizio: incipitsModel.currentIncipit)
            })
        }
        .ignoresSafeArea(.keyboard)
        
//        .onReceive(timer) { _ in
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//                if timeRemaining == 0 {
//                    shouldNavigate = true
//                }
//            }
//        }
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
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
//            ToolbarItem(placement: .principal) {
//                Text("\(timeRemaining)")
//                    .font(Font.custom("Life Savers", size: 31))
//                    .fontWeight(.bold)
//                    .frame(width: 45, height: 18)
//            }
        }
        .blur(radius: alertClass.showingAlert ? 12 : 0)
        alertClass.showingAlert == true ? AlertView() : nil
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
