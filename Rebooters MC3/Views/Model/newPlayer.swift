//
//  newPlayer.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 17/02/22.
//

import SwiftUI

struct newPlayer: View {
    var content = "Add new player"
    
    var body: some View {
        ZStack {
            Image("PLAYERS")
            Text(content)
                .foregroundColor(.black)
                .font(.system(size: 27))
        }
    }
}

//struct newPlayer_Previews: PreviewProvider {
//    static var previews: some View {
//        newPlayer()
//    }
//}
