//
//  HomeView.swift
//  App07-Todo-Firebase
//
//  Created by Brenda Saucedo on 21/09/22.
//

import SwiftUI

struct HomeView: View {
    
    // Allow once the login
    @AppStorage("Page") var currentPage: Page = .login
    
    var body: some View {
        
        VStack {
            
            switch currentPage {
                case .login:
                    LoginView()
                case .taskList:
                    TaskListView()
            }
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
