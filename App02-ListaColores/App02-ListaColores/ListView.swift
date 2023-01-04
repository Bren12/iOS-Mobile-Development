//
//  ListView.swift
//  App02-ListaColores
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
                    Section("American") {
                        // Displays the data of the "american" array.
                        ForEach(Colour.american) {
                            color in
                            // Navigate to another screen with the
                            // selected color.
                            NavigationLink {
                                ColorView(colour: color)
                            } label: {
                                // Display the name of the color.
                                Text(color.name)
                                    .padding()
                            }
                        }
                    }
                    
                    // Another Section
                    Section {
                        // Displays the data of the "spanish" array.
                        ForEach(Colour.spanish) {
                            color in
                            // Navigate to another screen with the
                            // selected color.
                            NavigationLink {
                                ColorView(colour: color)
                            } label: {
                                HStack {
                                    // Display the name of the color.
                                    Text(color.name)
                                        .padding()
                                    // Display the darkness of the color.
                                    Text(color.dark ? "Dark" : "Light")
                                }
                            }
                        }
                    } header: {
                        // Display the section name.
                        Text("Spanish")
                            .font(.system(.largeTitle))
                    }
                    
                    // Another Section
                    Section {
                        // Displays the data of the "flatUI" array.
                        ForEach(Colour.flatUI) {
                            color in
                            // Navigate to another screen with the
                            // selected color.
                            NavigationLink {
                                ColorView(colour: color)
                            } label: {
                                // Display the name of the color.
                                Text(color.name)
                                    .padding()
                            }
                        }
                    
                    } header: {
                        // Display the section name.
                        Text("FlatUI")
                            .font(.system(.largeTitle))
                    }
                    
                }
                // Remove the option for dropdown lists.
                .listStyle(InsetGroupedListStyle())
                
            }
            // Headline
            .navigationTitle("Lista Colores")
            // Position
            .navigationBarTitleDisplayMode(.inline)
            // Customize Navigation Bar Title
            .navigationBarColor(.white, UIColor(Colour.ElectronBlue.colour))
            
        }
        
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
