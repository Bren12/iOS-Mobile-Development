//
//  ListView.swift
//  App03-Lista
//
//  Created by Brenda Saucedo on 15/08/22.
//

import SwiftUI

struct ListView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                List {
                    
                    // Section Name
                    Section("Friends") {
                        
                        // Displays the data of the "foraneo" user array.
                        ForEach(User.friends, id: \.id) {
                            person in
                            // Navigate to another screen with the
                            // selected user.
                            NavigationLink {
                                ContactDetailView(user: person)
                                    .accentColor(.green)
                            } label: {
                                
                                HStack {
                                    // Display the user frame/icon
                                    RowUserView(user: person)
                                    
                                    Spacer()
                                        .frame(width: 20)
                                    
                                    // Display the name of the user.
                                    Text(person.firstName + " " + person.lastName)
                                        .font(.headline)
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                // Remove the option for dropdown lists.
                .listStyle(InsetGroupedListStyle())
            }
            // Headline
            .navigationTitle("Contactos")
            // Position
            .navigationBarTitleDisplayMode(.inline)
            // Customize Navigation Bar Title
            .navigationBarColor(.white, UIColor(Colour.DraculaOrchid.colour))
            
        }
        
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .accentColor(Colour.DraculaOrchid.colour)
    }
}
