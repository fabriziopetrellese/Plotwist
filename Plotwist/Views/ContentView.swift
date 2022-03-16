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
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    let text1: LocalizedStringKey = "text1"
    let text2: LocalizedStringKey = "text2"
    let text3: LocalizedStringKey = "text3"
    let text4: LocalizedStringKey = "text4"
    let text5: LocalizedStringKey = "text5"
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("plotwistVector")
                    .resizable()
                    .frame(width: 162.09, height: 123)
                Spacer()
                                
                NavigationLink(destination: GuidedView(), isActive: $isView1Active) {
                    
                    CardModel1(title: text1, description: text4)
                    
                }
                .isDetailLink(false)
                .simultaneousGesture(TapGesture().onEnded {
                    navigationRoot.mode1 = true
                })
//                .offset(x: -5, y: 35)
                
                NavigationLink(destination: GuidedView(), isActive: $isView1Active) {
                    
                    CardModel2(title: text2, description: text5)
                    
                }
                .isDetailLink(false)
                .simultaneousGesture(TapGesture().onEnded {
                    navigationRoot.mode2 = true
                })
//                .offset(x: -5, y: -20)
                
                NavigationLink(destination: SettingsView()) {
                    
                    SettingsButtonModel(title: text3)
                    
                }
//                .offset(x: -5, y: -25)
                Spacer()
            }
//            .offset(x: 0, y: -55)
            .background(
                Image("BACK")
                    .ignoresSafeArea()
            )
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
        .onReceive(navigationRoot.$backToRoot) { moveToDashboard in
            if moveToDashboard {
                isView1Active = false
                navigationRoot.backToRoot = false
            }
        }
        .environmentObject(IncipitsModel())
        .environmentObject(PlayersModel())
        .environmentObject(StoriesModel())
        .environmentObject(AlertClass())
        .environmentObject(CategoriesModel())
        .environmentObject(navigationRoot)
        .preferredColorScheme(.light)
        .onAppear(){
            MusicClass.shared.setup()
//            MusicClass.shared.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}


extension View {
    func dismissKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
