//
//  SerieRowView.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 21/08/22.
//

import SwiftUI

struct SerieRowView: View {
    
    // Variable
    var serie: Media
    
    var body: some View {
        
        VStack {
            
            // Name of the serie
            Text(serie.name)
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .heavy))
            
            // Image of the serie
            Image(serie.images[0])
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    
                    VStack {
                        
                        Spacer()
                        
                        // Score of the serie
                        HStack {
                            
                            ScoreView(score: serie.score)
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

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        SerieRowView(serie: Media(name: "Friends ", year: 1994, rated: .TV14, genre: ["Comedy", "Drama"], duration: "25m", headline: "I'll be there for you", overview: "The misadventures of a group of friends as they navigate the pitfalls of work, life and love in Manhattan.", score: 84, images: ["Friends1","Friends2","Friends3","Friends4","Friends5"], trailer: "https://youtu.be/hDNNmeeJs1Q"))
    }
}
