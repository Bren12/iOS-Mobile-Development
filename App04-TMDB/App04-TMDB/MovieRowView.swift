//
//  MovieRowView.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct MovieRowView: View {
    
    // Variable
    var movie: Media
    
    var body: some View {
        
        VStack {
            
            // Name of the movie
            Text(movie.name)
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .bold))
            
            // Image of the movie
            Image(movie.images[0])
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    
                    VStack {
                        
                        Spacer()
                        
                        // Score of the movie
                        HStack {
                            
                            ScoreView(score: movie.score)
                                .padding(.leading, 30)
                                .padding(.bottom, -35)
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                )
            
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 55)
        
    }
    
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Media(name: "The Tomorrow War ", year: 2021, rated: .PG13, genre: ["Action", "Science Fiction", "Adventure"], duration: "2h 18m", headline: "The fight for tomorrow begins today.", overview: "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.", score: 78, images: ["TheTomorrowWar1","TheTomorrowWar2","TheTomorrowWar3","TheTomorrowWar4","TheTomorrowWar5"], trailer: "https://youtu.be/RQjEbkV-9ZM"))
    }
}
