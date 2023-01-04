//
//  ColorView.swift
//  App02-ListaColores
//
//  Created by Brenda Saucedo on 15/08/22.
//

import SwiftUI

struct ColorView: View {
    
    // Variable
    var colour: Colour
    
    var body: some View {
        
        ZStack {
            // Background Color Selected
            colour.colour
            
            VStack {
                
                if colour.dark {
                    // If the color is dark, diplay the
                    // name of the color in white.
                    Text(colour.name)
                        .foregroundColor(.white)
                } else {
                    // If the color is light, diplay the
                    // name of the color in black.
                    Text(colour.name)
                        .foregroundColor(.black)
                }
                
            }
            
        }
        // Headline
        .navigationTitle(colour.name)
        // Ignore Edges
        .edgesIgnoringSafeArea(.bottom)
        
    }
    
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(colour: Colour.Alizarin)
    }
}
