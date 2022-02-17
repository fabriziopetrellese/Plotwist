//
//  ContentView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 14/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Name of the Game")
                    .font(Font.custom("Quick Pencil", size: 50))
                    .font(.largeTitle)
                    .bold()
                    .offset(x: 0, y: -18)
                Spacer()
                
                //GUIDED STORYTELLING
                NavigationLink(destination: GuidedView()) {
                    ZStack {
                        Image("CARD1")
                        Image("OMINO1")
                            .offset(x: 100, y: -103)
                        Text("Guided")
                            .fontWeight(.bold)
                            .offset(x: -70, y: -70)
                            .font(Font.custom("Quick Pencil", size: 30))
                            .foregroundColor(.black)
                        Text("Storytelling")
                            .fontWeight(.bold)
                            .offset(x: -65, y: -47)
                            .font(Font.custom("Quick Pencil", size: 31))
                            .foregroundColor(.black)
                        Text("""
                             Create a story with the
                             help of starters
                             and dices
                        """)
                            .foregroundColor(.darkGray)
                            .offset(x: -13, y: 32)
                            .font(Font.custom("Quick Pencil", size: 29))
                    }
                }.offset(x: -7, y: 7)
                
                //DICE STORYTELLING
                Button {
                } label: {
                    ZStack {
                        Image("CARD1")
                            .offset(x: 0, y: 7)
                        Image("OMINO2")
                            .offset(x: -160, y: 71)
                        Text("Dice")
                            .fontWeight(.bold)
                            .offset(x: -68, y: -66)
                            .font(Font.custom("Quick Pencil", size: 30))
                            .foregroundColor(.black)
                        Text("Storytelling")
                            .fontWeight(.bold)
                            .offset(x: -65, y: -42)
                            .font(Font.custom("Quick Pencil", size: 31))
                            .foregroundColor(.black)
                        Text("""
                    Create a story only
                     with dices
                    """)
                            .fontWeight(.regular)
                            .foregroundColor(.darkGray)
                            .offset(x: 2, y: 37)
                            .font(Font.custom("Quick Pencil", size: 29))
                    }
                }.offset(x: -8, y: -1)
                
                //RANDOM DICE THROW
                Button {
                    
                } label: {
                    ZStack {
                        Image("MODES")
                            .offset(x: 0, y: 10)
                        Image("rolldices")
                            .offset(x: 95, y: 5)
                        Text("Random dice")
                            .font(Font.custom("Quick Pencil", size: 30))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .offset(x: -59, y: -4)
                        Text("throw")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .font(Font.custom("Quick Pencil", size: 30))
                            .offset(x: -58, y: 22)
                    }
                }.offset(x: -7, y: 0)
                
                //SETTINGS
                NavigationLink(destination: SettingsView()) {
                    ZStack {
                        Image("MODES")
                        Text("Settings")
                            .font(Font.custom("Quick Pencil", size: 31))
                            .fontWeight(.bold)
                            .offset(x: -80.5, y: -2)
                            .foregroundColor(.black)
                        Image("ROTELLA")
                            .offset(x: 95, y: -2)
                    }
                }.offset(x: -8, y: 6)
                Spacer()
            }
            .background(
                Image("BACK")
                    .ignoresSafeArea()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
