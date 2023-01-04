//
//  ContactDetailView.swift
//  App03-Lista
//
//  Created by Brenda Saucedo on 15/08/22.
//

import SwiftUI

struct ContactDetailView: View {
    
    // Variable with the user info.
    var user: User
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                // Display the user frame/icon.
                ProfileUserView(user: user)
                
                // Display the user name.
                Text(user.firstName + " "  + user.lastName)
                    .font(.title)
                    .foregroundColor(user.colorFrame)
                
                Divider()
                
                Spacer()
                    .frame(height: 25)
                
                VStack(spacing: 20) {
                    
                    // Career
                    HStack {
                        
                        // Label
                        Text("Career")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        // Value
                        Text(user.career)
                            .font(.subheadline)
                        
                    }
                    .padding(.horizontal,35)
                    
                    // Email
                    HStack {
                        
                        // Label
                        Text("Email")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        // Value
                        Text(user.email)
                            .font(.subheadline)
                        
                    }
                    .padding(.horizontal,35)
                    
                    // Phone
                    HStack {
                        
                        // Label
                        Text("Phone")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        // Value
                        Text("(" + user.country + ") " + String(user.number))
                            .font(.subheadline)
                        
                    }
                    .padding(.horizontal,35)
                    
                    // Gender
                    HStack {
                        
                        // Label
                        Text("Gender")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        // Value
                        Text(user.sexF ? "Femenine" : "Masculine")
                            .font(.subheadline)
                        
                    }
                    .padding(.horizontal,35)
                    
                }
                
                Spacer()
                    .frame(height: 330)
                
            }
            
        }
        .ignoresSafeArea()
        .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
            ZStack {
                // Headline User name
                Text("@" + user.userID)
                    .foregroundColor(user.colorFrame)
                    .padding(.top,-58)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(user: User(id: 0, userID: "Bren", img: "👾", firstName: "Brenda", lastName: "Saucedo", career: "ITC", sexF: true, email: "bren@hotmail.com", number: 5117785623, country: "🇲🇽", colorFrame: .purple))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
