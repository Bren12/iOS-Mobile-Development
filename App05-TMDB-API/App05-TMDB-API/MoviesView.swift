//
//  MoviesView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct MoviesView: View {
    
    // Received parameter.
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // Verify if there are movies in the array.
                if mediaModel.movies.count > 0 {
                    
                    TabView {
                        
                        // Displays the data of the "movies" array.
                        ForEach(mediaModel.movies) { movie in
                            
                            // Navigate to another screen with the
                            // selected movie.
                            NavigationLink {
                                MediaDetailView(mediaModel: mediaModel, media: movie)
                            } label: {
                                // Display on screen the MovieRowView with the actual movie.
                                MediaRowView(media: movie)
                            }
                            
                        }
                        
                    }
                    // Paged Scrolling TabView.
                    .tabViewStyle(.page)
                    
                } else {
                    // On the other case, there are no movies to display.
                    Text("No hay películas")
                }
                
            }
            // Headline
            .navigationTitle("Movies")
            // Position
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
