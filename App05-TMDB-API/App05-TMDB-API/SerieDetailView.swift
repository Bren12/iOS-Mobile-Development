//
//  SerieDetailView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 27/08/22.
//

import SwiftUI
import Kingfisher
import CoreMedia

struct SerieDetailView: View {
    
    // Received parameters.
    @ObservedObject var mediaModel: MediaModel
    var media: MediaSerie
    
    var body: some View {
        
        // To adjust some frames according to the size of the screen.
        GeometryReader { geometry in
            
            VStack {
                
                // Name of the serie.
                Text(media.name)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                
                // Year of the serie.
                Text("(")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .ultraLight))
                + Text(String(media.first_air_date))
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .ultraLight))
                + Text(")")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .ultraLight))
                
                // Genres of the serie
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 0) {
                        
                        // Displays the data of the "genre" array.
                        ForEach(media.genres, id: \.self) { genre in
                            
                            Text(genre)
                                .foregroundColor(.red)
                                .font(.callout)
                            
                            // Divider
                            if (genre != media.genres.last) {
                                Text(" • ")
                                    .foregroundColor(.red)
                                    .font(.callout)
                            }
                            
                        }
                        
                    }
                    .frame(width: geometry.size.width)
                    
                }
                
                // Image of the serie.
                KFImage(URL(string: media.backdrop_path))
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        
                        VStack {
                            
                            Spacer()
                            
                            HStack {
                                
                                // Score of the serie.
                                ScoreView(score: media.vote_average)
                                    .padding(.leading, 50)
                                    .padding(.bottom, -35)
                                
                                Spacer()
                                
                            }
                            
                        }
                        
                    )
                
                // Navigate to a specific screen on click.
                NavigationLink {
                    SerieVideosView(mediaModel: mediaModel, mediaID: media.id)
                } label: {
                    // Display the videos label.
                    Label("Videos", systemImage: "film.fill")
                        .foregroundColor(.red)
                }
                
                Spacer()
                    .frame(height: 25)
                
                ZStack {
                    
                    // Background
                    Color.red
                    
                    ScrollView {
                        VStack {
                            // Overview of the movie.
                            Text(media.overview)
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                                .padding()
                        }
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct SerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SerieDetailView(mediaModel: MediaModel(), media: MediaSerie(id: 1, name: "TITULO", first_air_date: "2022", genres: ["Action","Fantasy"], overview: "afejkfndsoifwfo oidhfisfifsihfsgh idgfhsudj wejthg ergujh ebfhgdbshgbsfkhdgsbfh gbfhdngfbdsnmfg bdhsfg bdhsfgbdhfbsdnfbnvdsnbfshdhds fbvndgfbgfds afejkfndsoifwfo oidhfisfifsihfsgh idgfhsudj wejthg ergujh ebfhgdbshgbsfkhdgsbfh gbfhdngfbdsnmfg bdhsfg bdhsfgbdhfbsdnfbnvdsnbfshdhds fbvndgfbgfds afejkfndsoifwfo oidhfisfifsihfsgh idgfhsudj wejthg ergujh ebfhgdbshgbsfkhdgsbfh gbfhdngfbdsnmfg bdhsfg bdhsfgbdhfbsdnfbnvdsnbfshdhds fbvndgfbgfds afejkfndsoifwfo oidhfisfifsihfsgh idgfhsudj wejthg ergujh ebfhgdbshgbsfkhdgsbfh gbfhdngfbdsnmfg bdhsfg bdhsfgbdhfbsdnfbnvdsnbfshdhds fbvndgfbgfds", vote_average: 10, poster_path: "", backdrop_path: ""))
    }
}
