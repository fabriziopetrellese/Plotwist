//
//  AlertView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 04/03/22.
//

import SwiftUI
import AVFoundation

struct AlertView: View {
    @EnvironmentObject var alertClass: AlertClass
    @EnvironmentObject var navigationRoot: NavigationRoot
    
    let mainMenu: LocalizedStringKey = "mainMenu"
    let quit: LocalizedStringKey = "quit"
    let yesAlert: LocalizedStringKey = "yesAlert"
    let noAlert: LocalizedStringKey = "noAlert"
    
    var body: some View {
        ZStack {
            Image("ominoAlert")
                .offset(x: 0, y: -122)
            Image("customAlertPNG")
            Text(mainMenu)
                .font(Font.custom("Life Savers", size: 23))
                .fontWeight(.bold)
                .offset(x: 0, y: -97.5)
            Image("ominoAlertMani")
                .offset(x: 0, y: -116)
            Text(quit)
                .font(Font.custom("Life Savers", size: 27))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .frame(width: 250, height: 90)
                .foregroundColor(.black)
                .offset(x: 0, y: -28)
            Button {
                alertClass.showingAlert = false
            } label: {
                ZStack {
                    Image("noAlert")
                    Text(noAlert)
                        .font(Font.custom("Life Savers", size: 25))
                        .fontWeight(.heavy)
                }
            }
            .offset(x: 77, y: 59)
            Button {
                alertClass.yesQuit.toggle()
                navigationRoot.playerButton = 0
                navigationRoot.mode1 = false
                navigationRoot.mode2 = false
                navigationRoot.backToRoot = true
                if alertClass.yesQuit {
                    alertClass.synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
                }
            } label: {
                ZStack {
                    Image("yesAlert")
                    Text(yesAlert)
                        .font(Font.custom("Life Savers", size: 25))
                        .fontWeight(.heavy)
                }
            }
            .offset(x: -80, y: 59)
        }
        .offset(x: 0, y: -300)
    }
}


struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
            .environmentObject(AlertClass())
            .environmentObject(NavigationRoot())
    }
}
