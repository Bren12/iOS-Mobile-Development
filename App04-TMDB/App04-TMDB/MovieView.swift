//
//  MovieView.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct MovieView: View {
    
    // Received parameter.
    @ObservedObject var mediaModel = MediaModel()
    
    var body: some View {
        
            NavigationView {
                
                VStack {
                    
                    TabView {
                        
                        // Displays the data of the "movies" array.
                        ForEach(mediaModel.movies) { movie in
                        
                            // Navigate to another screen with the
                            // selected movie.
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                // Display on screen the MovieRowView with the actual movie.
                                MovieRowView(movie: movie)
                            }
                            
                        }
                        
                    }
                    // Paged Scrolling TabView.
                    .tabViewStyle(.page)
                    
            }
            // Headline
            .navigationTitle("Movies")
            // Position
            .navigationBarTitleDisplayMode(.inline)
                
        }
        
    }
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(mediaModel: MediaModel())
    }
}
