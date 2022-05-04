//
//  SiriView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 20/02/22.
//

import SwiftUI
import AVFoundation

struct SiriView: View {
    @EnvironmentObject var storiesModel: StoriesModel
    @EnvironmentObject var navigationRoot: NavigationRoot
    @EnvironmentObject var alertClass: AlertClass
    
    @FetchRequest(sortDescriptors: []) var completestories: FetchedResults<CompleteStory>
    
    @State var storyTitle: String = ""
    @State var isSaved: Bool = false
    
    let untitled: LocalizedStringKey = "untitled"
    let finalTitle: LocalizedStringKey = "finalTitle"
    let language: LocalizedStringKey = "language"
    let speech: LocalizedStringKey = "speech"
    let menu: LocalizedStringKey = "menu"
    let lang = String(format: NSLocalizedString("language", comment: ""))
    let saveStory: LocalizedStringKey = "saveStory"
    let storySaved: LocalizedStringKey = "storySaved"
    let doneKeyboard: LocalizedStringKey = "doneKeyboard"
    
    var body: some View {
        VStack {
            TextField("", text: $storyTitle)
                .placeholder(when: storyTitle.isEmpty) {
                    Text(untitled)
                        .font(Font.custom("Life Savers", size: 32))
                        .foregroundColor(.gray)
                        .fontWeight(.heavy)
                }
                .ignoresSafeArea(.keyboard)
                .font(Font.custom("Life Savers", size: 40).weight(.heavy))
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .frame(width: 286)
            
            Spacer()
            
            ZStack {
                Image("storyRectangle")
                    .resizable()
                    .frame(width: 0.865 * UIScreen.main.bounds.width, height: 0.455 * UIScreen.main.bounds.height)
                    .padding(.vertical, 10)
                    .ignoresSafeArea(.keyboard)
                
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    Text(storiesModel.fullStory)
                        .font(Font.custom("Life Savers", size: 28))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.darkGray)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width)
                }
            }
            .frame(width: 0.88 * UIScreen.main.bounds.width, height: 0.40 * UIScreen.main.bounds.height)
        }
            .ignoresSafeArea(.keyboard)
            
            Spacer()
            
            Button {
                alertClass.handleSynthesizer(storiaCompleta: storiesModel.fullStory,
                                             lingua: lang)
            } label: {
                ListenButton(label: speech,
                             icon: "playpause.fill",
                             shouldShowOmino: false)
            }
            .ignoresSafeArea(.keyboard)
            .padding(.top)
            
            Button {
                alertClass.showingAlert = true
            } label: {
                ListenButton(label: menu,
                             icon: "house.fill",
                             shouldShowOmino: false)
            }
            .ignoresSafeArea(.keyboard)
            .padding(.bottom)
            .padding(.top, 8)
        }
        .position(x: 0.502 * UIScreen.main.bounds.width, y: 0.4 * UIScreen.main.bounds.height)
        .ignoresSafeArea(.keyboard)
        .background(
            Image("Background")
                .ignoresSafeArea()
                .position(x: 0.502 * UIScreen.main.bounds.width, y: 0.4 * UIScreen.main.bounds.height)
                .onTapGesture {
                    dismissKeyboard()
                }
        )
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                if (isSaved == false) {
                    Button {
                        
                        if (storyTitle != "" && storyTitle != " ") {
                            DataController.shared.saveStory(storia: storiesModel.fullStory, titolo: storyTitle)
                            isSaved = true
                        } else {
                            DataController.shared.saveStory(storia: storiesModel.fullStory,
                                                            titolo: String(format: NSLocalizedString("untitled", comment: "")))
                            isSaved = true
                        }
                        
                    } label: {
                        Text(saveStory)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                    }
                    
                } else {
                    Text(storySaved)
                        .foregroundColor(.gray)
                        .fontWeight(.heavy)
                }
            }
            
            ToolbarItem(placement: .keyboard) {
                Button {
                    hideKeyboard()
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }
        .blur(radius: alertClass.showingAlert ? 9 : 0)
        if alertClass.showingAlert == true {
            AlertView()
        }
    }
}

struct SiriView_Previews: PreviewProvider {
    static var previews: some View {
        SiriView(storyTitle: "")
            .environmentObject(StoriesModel())
            .environmentObject(AlertClass())
    }
}

