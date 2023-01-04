//
//  TextView.swift
//  App01-MiPerfil
//
//  Created by Brenda Saucedo on 11/08/22.
//

import SwiftUI

struct TextView: View {
    
    // Variables
    var label: String = "Carrera"
    var value: String = "ITC"
    
    var body: some View {
        
        HStack {
            
            // Label
            Text(label)
                .fontWeight(.black)
                .padding()
            
            Spacer()
            
            // Value
            Text(value)
                .fontWeight(.bold)
                .padding()
        }
        .padding(.horizontal, 40)
        
    }
    
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
