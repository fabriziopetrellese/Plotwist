//
//  NextTurn.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 16/02/22.
//

import SwiftUI

struct NextTurn: View {
    var body: some View {
        
        ZStack {
            Image("Background1")
                .ignoresSafeArea()
            
            VStack {
                Text("It's Giovanni's turn, pass the phone")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Quick Pencil", size: 55))
                    .frame(width: 300, height: 200, alignment: .center)
                    .offset(x: 0.0, y: 50.0)

                
                Button {
                    
                } label: {
                    Image("imhere")
                }
                .offset(x: 0.0, y: 195.0)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        

    }
}

struct NextTurn_Previews: PreviewProvider {
    static var previews: some View {
        NextTurn()
    }
}
