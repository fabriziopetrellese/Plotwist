//
//  SettingsView.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 15/02/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                Text("Music")
                    .font(Font.custom("Quick Pencil", size: 40))
            }.tint(.blue)
            .padding(.horizontal, 59)
            Image("MUSICON")
                .offset(x: 109, y: -108)
            Spacer()
            Button {
                
            } label: {
                ZStack {
                    Image("cardButton")
                        .padding(.top, 5)
                    Text("Starters customization")
                        .font(.system(size: 23))
                        .foregroundColor(.black)
                }.padding(.top, 50.0)
            }
            Button {
                
            } label: {
                ZStack {
                    Image("cardButton")
                    Text("About us")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }.padding(.bottom, 50.0)
            }
            Spacer()
            Text("Language")
                .padding(.top, 30.0)
                .font(Font.custom("Quick Pencil", size: 44))
            HStack(spacing: 38) {
                Button {
                    
                } label: {
                    Image("italian")
                }
                Button {
                    
                } label: {
                    Image("english")
                }
                Button {
                    
                } label: {
                    Image("french")
                }
            }.padding()
            Image("ominoSettings")
                .offset(x: 202, y: 50)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Settings")
                    .font(Font.custom("Quick Pencil", size: 45))
            }
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
