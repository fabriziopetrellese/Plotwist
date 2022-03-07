//
//  AlertView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 04/03/22.
//

import SwiftUI

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
                .font(Font.custom("Quick Pencil", size: 27))
                .offset(x: 0, y: -96)
            Image("ominoAlertMani")
                .offset(x: 0, y: -116)
            Text(quit)
                .font(Font.custom("Quick Pencil", size: 35))
                .multilineTextAlignment(.center)
                .frame(width: 211, height: 60)
                .foregroundColor(.black)
                .offset(x: 0, y: -23)
            Button {
                navigationRoot.playerButton = 0
                navigationRoot.mode1 = false
                navigationRoot.mode2 = false
                navigationRoot.backToRoot = true
            } label: {
                ZStack {
                    Image("yesAlert")
                    Text(yesAlert)
                        .font(Font.custom("Quick Pencil", size: 35))
                }
            }
            .offset(x: 77, y: 59)
            Button {
                alertClass.showingAlert = false
            } label: {
                ZStack {
                    Image("yesAlert")
                    Text(noAlert)
                        .font(Font.custom("Quick Pencil", size: 35))
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
