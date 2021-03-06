//
//  hideKeyboardButton.swift
//  Rebooters MC3
//
//  Created by Fabrizio Petrellese on 17/02/22.
//

import SwiftUI

struct hideKeyboardButton: View {
    var body: some View {
        Button {
            hideKeyboard()
        } label: {
            Image(systemName: "keyboard.chevron.compact.down")
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct hideKeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        hideKeyboardButton()
    }
}

