//
//  LanguageView.swift
//  Plotwist
//
//  Created by Fabrizio Petrellese on 20/02/22.
//

import SwiftUI

struct LanguageView: View {
    @Environment(\.dismiss) var cancel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Language view")
                    .font(.title)
            }
            .navigationTitle("Language")
                .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        cancel()
                    }.foregroundColor(.blue)
                }
            }
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView()
    }
}
