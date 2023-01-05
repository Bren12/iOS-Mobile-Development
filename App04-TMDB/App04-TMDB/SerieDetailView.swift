//
//  SerieDetailView.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 21/08/22.
//

import SwiftUI

struct SerieDetailView: View {
    
    // Received parameter.
    var serie: Media
    
    var body: some View {
        
        // To adjust some frames according to the size of the screen.
        GeometryReader { geometry in
            
            VStack {
                
                // Serie Basic Data
                HStack(spacing: 0) {
                    
                    // Name of the serie.
                    Text(serie.name)
                        .font(.system(size: 30, weight: .bold))
                    
                    // Year of the serie.
                    Text("(")
                        .font(.system(size: 30, weight: .ultraLight))
                    Text(String(serie.year))
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
                            ForEach(serie.genre, id: \.self) { genre in
                                
                                Text(genre)
                                    .foregroundColor(.red)
                                    .font(.callout)
                                
                                // Divider
                                if (genre != serie.genre.last) {
                                    Text(", ")
                                        .foregroundColor(.red)
                                        .font(.callout)
                                }
                                
                            }
                            
                            // Divider
                            Text(" • ")
                                .foregroundColor(.red)
                            
                            // Duration of the serie
                            Text(serie.duration)
                                .font(.system(size: 15))
                                .foregroundColor(.red)
                            
                        }
                        .frame(width: geometry.size.width-10, alignment: .center)
                        
                    }
                    
                }
                
                HStack(spacing: 0) {
                    
                    TabView {
                        
                        // Displays the data of the "images" array.
                        ForEach(serie.images, id: \.self) { image in
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
                        
                        // Score of the serie
                        ScoreView(score: serie.score)
                        
                        // Navigate to a specific screen on click.
                        NavigationLink {
                            WebView(html: serie.trailer)
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
                    
                    // Headline of the serie if it exists.
                    if (serie.headline.count > 0) {
                        Text("\"")
                            .italic()
                            .foregroundColor(.red)
                        + Text(serie.headline)
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
                                // Overview of the serie.
                                Text(serie.overview)
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

struct SerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(serie: Media(name: "The Mandalorian ", year: 2019, rated: .TV14, genre: ["Sci-Fi & Fantasy", "Action & Adventure", "Western", "Drama"], duration: "35m", headline: "Bounty hunting is a complicated profession.", overview: "After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.", score: 85, images: ["TheMandalorian1","TheMandalorian2","TheMandalorian3","TheMandalorian4","TheMandalorian5"], trailer: "https://youtu.be/eW7Twd85m2g"))
    }
}
