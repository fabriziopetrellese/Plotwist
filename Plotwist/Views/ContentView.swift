//
//  ContentView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 14/02/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var navigationRoot = NavigationRoot()
    @State var isView1Active: Bool = false
    
    let text1: LocalizedStringKey = "text1"
    let text2: LocalizedStringKey = "text2"
    let text3: LocalizedStringKey = "text3"
    let text4: LocalizedStringKey = "text4"
    let text5: LocalizedStringKey = "text5"


    var body: some View {
        NavigationView {
            VStack {
                Image("appname")
                    .resizable()
                    .frame(width: 162.09, height: 123)
                    .padding(.bottom, 47)
                Spacer()
                
                NavigationLink(destination: GuidedView(), isActive: $isView1Active) {
                    
                    CardModel1(title: text1, description: text4)
                    
                }
                .isDetailLink(false)
                .simultaneousGesture(TapGesture().onEnded {
                    navigationRoot.mode1 = true
                })
                .offset(x: -7, y: 7)
                
                NavigationLink(destination: GuidedView(), isActive: $isView1Active) {
           
                    CardModel2(title: text2, description: text5)
                    
                }
                .isDetailLink(false)
                .simultaneousGesture(TapGesture().onEnded {
                    navigationRoot.mode2 = true
                })
                .offset(x: -8, y: -1)
                
                NavigationLink(destination: SettingsView()) {
                    
                    SettingsButtonModel(title: text3)
                    
                }.offset(x: -8, y: 6)
                Spacer()
            }
            .offset(x: 0, y: -39)
            .background(
                Image("BACK")
                    .ignoresSafeArea()
            )
        }
        .onReceive(navigationRoot.$backToRoot) { moveToDashboard in
                        if moveToDashboard {
                            isView1Active = false
                            navigationRoot.backToRoot = false
                        }
                    }
        .environmentObject(PlayersModel())
        .environmentObject(IncipitsModel())
        .environmentObject(StoriesModel())
        .environmentObject(navigationRoot)
        .environmentObject(AlertClass())
        .preferredColorScheme(.light)
            .onAppear(){
//                MusicClass.shared.setup()
//                MusicClass.shared.play()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//                //RANDOM DICE THROW
//                NavigationLink(destination: RandomDiceThrow()) {
//                    ZStack {
//                        Image("MODES")
//                            .offset(x: 0, y: 10)
//                        Image("rolldice")
//                            .offset(x: 95, y: 5)
//                        Text("Random dice")
//                            .font(Font.custom("Quick Pencil", size: 30))
//                            .foregroundColor(.black)
//                            .fontWeight(.bold)
//                            .offset(x: -59, y: -4)
//                        Text("throw")
//                            .fontWeight(.bold)
//                            .foregroundColor(.black)
//                            .font(Font.custom("Quick Pencil", size: 30))
//                            .offset(x: -58, y: 22)
//                    }
//                }.offset(x: -7, y: 0)



//ONBOARDING