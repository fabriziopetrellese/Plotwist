//
//  View+Extensions.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 03/03/22.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
