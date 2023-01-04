//
//  RowUserView.swift
//  App03-ListaColores
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct RowUserView: View {
    
    // Variable
    var user: User
    
    var body: some View {
        
        ZStack {
            // User icon
            Text(user.img)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                // User circle frame color
                .overlay(
                  Circle().stroke(user.colorFrame, lineWidth: 3)
                )
        }
        
    }
    
}

struct RowUserView_Previews: PreviewProvider {
    static var previews: some View {
        RowUserView(user: User(id: 0, userID: "Bren", img: "👾", firstName: "Brenda", lastName: "Saucedo", career: "ITC", sexF: true, email: "bren@hotmail.com", number: 5117785623, country: "🇲🇽", colorFrame: .purple))
    }
}
