//
//  Fonts.swift
//  App01-MiPerfil
//
//  Created by Brenda Saucedo on 11/08/22.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Remoto-Bold", size: 20 ))
            .foregroundColor(.white)
    }
}
