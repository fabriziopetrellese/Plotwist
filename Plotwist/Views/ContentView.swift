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
    @State var music: Bool = true
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    let text1: LocalizedStringKey = "text1"
    let text2: LocalizedStringKey = "text2"
    let text3: LocalizedStringKey = "text3"
    let text4: LocalizedStringKey = "text4"
    let text5: LocalizedStringKey = "text5"
    let saved: LocalizedStringKey = "saved"
    
    var body: some View {
        NavigationView {
            VStack {
                Image("plotwistVector")
                    .padding(.bottom, 30)
                
                NavigationLink(destination: GuidedView(), isActive: $isView1Active) {
                    CardModel1(title: text1, description: text4)
                        .padding(.top, 20)
                        .padding(.bottom, 6)
                }
                .isDetailLink(false)
                .simultaneousGesture(TapGesture().onEnded {
                    navigationRoot.mode1 = true
                })
                
                NavigationLink(destination: GuidedView(), isActive: $isView1Active) {
                    CardModel2(title: text2, description: text5)
                        .padding(.bottom, 10)
                }
                .isDetailLink(false)
                .simultaneousGesture(TapGesture().onEnded {
                    navigationRoot.mode2 = true
                })
                
                NavigationLink {
                    CompletedStories()
                } label: {
                    ZStack {
                        Image("yourStoriesCard")
//                            .padding(.top, 30)
                        HStack {
                            Text(saved)
                                .font(Font.custom("Life Savers", size: 23))
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
//                                .padding(.top, 27)
                            
                            Spacer()
                            
                            Image(systemName: "list.star")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
//                                .padding(.top, 27)
                        }
                        .padding(.horizontal, 72)
                    }
                    .padding(.leading, 4)
                }
                .padding(.bottom, 30)
                
//                NavigationLink(destination: SettingsView()) {
//                    SettingsButtonModel(title: text3)
//                        .padding(.bottom, 40)
//                }
            }
            .padding(.bottom, 80)
            .background(
                Image("BACK")
                    .ignoresSafeArea()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        music.toggle()
                        if music == true {
                            MusicClass.shared.play()
                        } else {
                            MusicClass.shared.pause()
                        }
                    } label: {
                        if music {
                            Image(systemName: "speaker.wave.3.fill")
                        } else {
                            Image(systemName: "speaker.slash.fill")
                                .padding(.trailing, 13)
                        }
                    }
                }
            }
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
            MusicClass.shared.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.locale, .init(identifier: "fr"))
    }
}





extension View {
    func dismissKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

class AppState {
  static let shared = AppState()

  var swipeEnabled = false
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return AppState.shared.swipeEnabled ?
        viewControllers.count > 1 : false
    }
}
