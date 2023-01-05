//
//  SerieRowView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 27/08/22.
//

import SwiftUI
import Kingfisher

struct SerieRowView: View {
    
    // Variable
    var media: MediaSerie
    
    var body: some View {
        
        VStack {
            
            // Name of the serie
            Text(media.name)
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .bold))
            
            
            // Image of the serie
            KFImage(URL(string: media.poster_path))
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    
                    VStack {
                        
                        Spacer()
                        
                        // Score of the serie
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

struct SerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        SerieRowView(media: MediaSerie(id: 1, name: "", first_air_date: "", genres: ["Mystery","Romance"], overview: "", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
