//
//  LoginView.swift
//  App07-Todo-Firebase
//
//  Created by Brenda Saucedo on 21/09/22.
//

import SwiftUI

struct LoginView: View {
    
    // Allow once the login
    @AppStorage("Page") var currentPage: Page?
    
    var body: some View {
        
        ZStack {
            
            // Background image
            Image("backgroundLog")
                .resizable()
                .scaledToFill()
                .frame(width: 100)
                .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                
                // Label
                Text("Bienvenido")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                    .padding(.bottom,40)
                
                // Login button
                Button {
                    currentPage = .taskList
                } label: {
                    Text("Login")
                        .frame(width: 150)
                        .font(.system(size: 20, weight: .bold))
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
            }
            
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
