//
//  ProfileUserView.swift
//  App03-Lista
//
//  Created by Brenda Saucedo on 11/10/22.
//

import SwiftUI

struct ProfileUserView: View {
    
    // Variable
    var user: User
    
    var body: some View {
        
        ZStack {
            
            VStack {
                // User icon
                Text(user.img)
                    .shadow(radius: 10)
                    .font(.custom("", size: 70, relativeTo: .largeTitle))
                    .frame(width: 120, height: 120)
                    // User circle frame color
                    .overlay(
                      Circle().stroke(user.colorFrame, lineWidth: 5)
                        .shadow(radius: 10)
                    )
            }
            
        }
        
    }
    
}

struct ProfileUserView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUserView(user: User(id: 0, userID: "Bren", img: "👾", firstName: "Brenda", lastName: "Saucedo", career: "ITC", sexF: true, email: "bren@hotmail.com", number: 5117785623, country: "🇲🇽", colorFrame: .purple))
    }
}
