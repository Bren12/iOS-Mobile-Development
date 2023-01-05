//
//  MediaRowView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI
import Kingfisher

struct MediaRowView: View {
    
    // Variable
    var media: Media
    
    var body: some View {
        
        VStack {
            
            // Name of the movie
            Text(media.title)
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .bold))
            
            // Image of the movie
            KFImage(URL(string: media.poster_path))
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    
                    VStack {
                        
                        Spacer()
                        
                        // Score of the movie
                        HStack {
                            
                            ScoreView(score: media.vote_average)
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

struct MediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRowView(media: Media(id: 1, title: "", release_date: "", adult: false, genres: ["Mystery","Romance"], overview: "", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
