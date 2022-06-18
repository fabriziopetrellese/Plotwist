//
//  SplashScreenView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 28/02/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var scale: CGFloat = 0.85
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                
                Image("icon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(30)
                    .scaleEffect(scale)
                    .animation(.linear(duration: 0.55).delay(0.65), value: scale)
            }
            .onAppear(perform: {
                scale += 9
            })
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
