//
//  MovieDetailView.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    // Received parameter.
    var movie: Media
    
    var body: some View {
        
        // To adjust some frames according to the size of the screen.
        GeometryReader { geometry in
            
            VStack {
                
                // Movie Basic Data
                HStack(spacing: 0) {
                    
                    // Name of the movie.
                    Text(movie.name)
                        .font(.system(size: 30, weight: .bold))
                    
                    // Year of the movie.
                    Text("(")
                        .font(.system(size: 30, weight: .ultraLight))
                    Text(String(movie.year))
                        .font(.system(size: 30, weight: .ultraLight))
                    Text(")")
                        .font(.system(size: 30, weight: .ultraLight))
                    
                }
                .frame(width: 350)
                .padding(.bottom, 1)
                
                HStack(spacing: 0) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            
                            // Displays the data of the "genre" array.
                            ForEach(movie.genre, id: \.self) { genre in
                                
                                Text(genre)
                                    .foregroundColor(.red)
                                    .font(.callout)
                                
                                // Divider
                                if (genre != movie.genre.last) {
                                    Text(", ")
                                        .foregroundColor(.red)
                                        .font(.callout)
                                }
                                
                            }
                            
                            // Divider
                            Text(" • ")
                                .foregroundColor(.red)
                            
                            // Duration of the movie
                            Text(movie.duration)
                                .font(.system(size: 15))
                                .foregroundColor(.red)
                            
                        }
                        .frame(width: geometry.size.width, alignment: .center)
                        
                    }
                    
                }
                
                HStack(spacing: 0) {
                    
                    TabView {
                        
                        // Displays the data of the "images" array.
                        ForEach(movie.images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    .frame(width: 160, height: 240, alignment: .top)
                    
                    VStack {
                        
                        // Score label
                        Text("Grade")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.top, -10)
                        
                        // Score of the movie
                        ScoreView(score: movie.score)
                        
                        // Navigate to a specific screen on click.
                        NavigationLink {
                            WebView(html: movie.trailer)
                        } label: {
                            // Display the trailer label.
                            Label("Trailer", systemImage: "film.fill")
                        }
                        .padding(.top, 30)
                        
                        // Design stuff
                        Text("                            ")
                        
                    }
                    
                }
                
                VStack {
                    
                    // Headline of the movie if it exists.
                    if (movie.headline.count > 0) {
                        Text("\"")
                            .italic()
                            .foregroundColor(.red)
                        + Text(movie.headline)
                            .italic()
                            .foregroundColor(.red)
                        + Text("\"")
                            .italic()
                            .foregroundColor(.red)
                    }
                    
                    ZStack {
                        
                        // Background
                        Color.red
                        
                        VStack {
                            ScrollView {
                                // Overview of the movie.
                                Text(movie.overview)
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                                    .padding()
                            }
                        }
                        
                    }
                    
                }
                .padding(.top, -30)
                
            }
            
        }
        
    }
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Media(name: "Shang-Chi and the Legend of the Ten Rings ", year: 2021, rated: .PG13, genre: ["Action", "Adventure", "Fantasy"], duration: "2h 12m", headline: "You can't outrun your destiny.", overview: "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.", score: 85, images: ["Shang-Chi1","Shang-Chi2","Shang-Chi3","Shang-Chi4","Shang-Chi5"], trailer: "https://youtu.be/8YjFbMbfXaQ"))
    }
}
