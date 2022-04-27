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
    
    var body: some View {
        VStack {
            TextField("", text: $storyTitle)
                .placeholder(when: storyTitle.isEmpty) {
                    Text(untitled)
                        .font(Font.custom("Life Savers", size: 32))
                        .foregroundColor(.gray)
                }
                .font(Font.custom("Life Savers", size: 40))
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .frame(width: 360)
            
            Spacer()
            
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
            .frame(width: 360, height: 260)
            
            Spacer()
            
            Button {
                alertClass.handleSynthesizer(storiaCompleta: storiesModel.fullStory,
                                             lingua: lang)
            } label: {
                ListenButton(label: speech,
                             icon: "playpause.fill",
                             shouldShowOmino: false)
            }
            
            Button {
                alertClass.showingAlert = true
            } label: {
                ListenButton(label: menu,
                             icon: "house.fill",
                             shouldShowOmino: false)
            }
        }
        .padding(.top, 30)
        .background(
            Image("Background")
                .ignoresSafeArea()
                .position(x: 180, y: 400)
        )
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
                        Text("Save")
                            .foregroundColor(.black)
                    }
                    
                } else {
                    Text("Saved")
                        .foregroundColor(.gray)
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

