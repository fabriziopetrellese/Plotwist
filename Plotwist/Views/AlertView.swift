//
//  AlertView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 04/03/22.
//

import SwiftUI

struct AlertView: View {
    @Binding var showingAlert: Bool
    @EnvironmentObject var navigationRoot: NavigationRoot
    
    var body: some View {
        ZStack {
            Image("ominoAlert")
                .offset(x: 0, y: -122)
            Image("customAlertPNG")
            Text("Main menu")
                .font(Font.custom("Quick Pencil", size: 27))
                .offset(x: 0, y: -96)
            Image("ominoAlertMani")
                .offset(x: 0, y: -116)
            Text("Do you want to leave the game?")
                .font(Font.custom("Quick Pencil", size: 35))
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 60)
                .foregroundColor(.black)
                .offset(x: 0, y: -23)
            Button {
                navigationRoot.mode1 = false
                navigationRoot.backToRoot = true
            } label: {
                ZStack {
                    Image("yesAlert")
                    Text("Yes")
                        .font(Font.custom("Quick Pencil", size: 35))
                }
            }
            .offset(x: 77, y: 59)
            Button {
                showingAlert.toggle()
            } label: {
                ZStack {
                    Image("yesAlert")
                    Text("No")
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
        AlertView(showingAlert: .constant(false))
    }
}
