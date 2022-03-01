//
//  AlertView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 26/02/22.
//

import SwiftUI

struct AlertView: View {
    @State private var alert = false

    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        alert = true
                    } label: {
                        Image(systemName: "house.fill")
                            .foregroundColor(.black)
                    }
                    .alert("Do you want to leave the game?", isPresented: $alert) {
                        Button ("Yes", role: .destructive) {
                        }
                        Button ("No", role: .cancel) {}
                    } message: {
                        Text("You will go back to the main menu")
                    }
                }
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
