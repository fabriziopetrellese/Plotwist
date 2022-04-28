//
//  DeleteAlertView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 28/04/22.
//

import SwiftUI
import AVFoundation

struct DeleteAlertView: View {
    @EnvironmentObject var alertClass: AlertClass
    
    let mainMenu: LocalizedStringKey = "mainMenu"
    let quit: LocalizedStringKey = "quit"
    let yesAlert: LocalizedStringKey = "yesAlert"
    let noAlert: LocalizedStringKey = "noAlert"
    
    var body: some View {
        ZStack {
            Image("ominoAlert")
                .offset(x: 0, y: -122)
            Image("customAlertPNG")
            Text("Delete Story") //Localize
                .font(Font.custom("Life Savers", size: 23))
                .fontWeight(.bold)
                .offset(x: 0, y: -97.5)
            Image("ominoAlertMani")
                .offset(x: 0, y: -116)
            Text("Are yous sure to delete the story?") //Localize
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
                alertClass.yesQuit = true
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

struct DeleteAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAlertView()
            .environmentObject(AlertClass())
    }
}

