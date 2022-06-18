//
//  Rebooters_MC3App.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 14/02/22.
//

import SwiftUI

@main
struct PlotwistApp: App {
    @State var splashOpacity = 1.0
    @State var moveIcon = false
    let dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    moveIcon.toggle()
                    splashOpacity = 0.0
                })
                .overlay(SplashScreenView()
                            .opacity(splashOpacity)
                            .animation(Animation.easeOut.delay(0.8), value: moveIcon)
                )
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
