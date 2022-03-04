//
//  ControlView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 03/03/22.
//

import SwiftUI

struct ControlView: View {
    @Binding var isControlsVisibile: Bool
    @Binding var showBrowse: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        VStack{
            
            
            
            Spacer()
            

                ControlButtonBar(showBrowse: $showBrowse, showSettings: $showSettings)
            
        }
    }
}





struct ControlButtonBar: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var modeSelection: NavigationRoot
    @Binding var showBrowse: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        HStack {
            
            //Oggetto Recente
            MostRecentelyPlacedButton().hidden(self.placementSettings.recentlyPlaced.isEmpty)
            
            Spacer()
            
            //Sfoglia Oggetti
            ControlButton(systemIconName: "square.grid.2x2") {
                print ("button pressed.")
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse, content: {
                //Browse view
                BrowseView(showBrowse: $showBrowse)
            })
            
            Spacer ()
            
            
            //Opzioni
//            ControlButton(systemIconName: "slider.horizontal.3") {
//                print ("button pressed.")
//                self.showSettings.toggle()
//            }.sheet(isPresented: $showSettings){
//                RealitySettingsView(showSettings: $showSettings)
//            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}

struct MostRecentelyPlacedButton: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View{
        Button(action: {
            print ("recently button press")
            self.placementSettings.selectedModel = self.placementSettings.recentlyPlaced.last
        }) {
            if let mostRecentlyPlacedModel = self.placementSettings.recentlyPlaced.last {
                Image (uiImage: mostRecentlyPlacedModel.thumbnail)
                    .resizable()
                    .frame(width: 46)
                    .aspectRatio(1/1, contentMode: .fit)
            } else {
                Image (systemName: "clock.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(width: 50, height: 50)
        .background(Color.white)
        .cornerRadius(8.0)
        
    }
}


/*
struct ControlVisibilityToggleButton: View {
    @Binding var isControlsVisibile: Bool
    
    var body: some View{
        HStack{
            
            Spacer ()
            
            ZStack {
                
                Color.black.opacity(0.25)
                
                Button(action: {
                    print( "button pressed.")
                    self.isControlsVisibile.toggle()
                }) {
                    Image (systemName: self.isControlsVisibile ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
        }
        .padding(.top, 100)
        .padding(.trailing, 20)
    }
}
*/
