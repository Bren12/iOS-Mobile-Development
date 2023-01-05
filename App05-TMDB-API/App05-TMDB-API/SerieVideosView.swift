//
//  SerieVideosView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 27/08/22.
//

import SwiftUI

struct SerieVideosView: View {
    
    // Variable
    @ObservedObject var mediaModel: MediaModel
    var mediaID: Int
    
    var body: some View {
        
        List {
            
            // Displays the data of the "videosSeries" array.
            ForEach(mediaModel.videosSerie) { serie in
                
                // Navigates to other link on click.
                NavigationLink(destination: {
                    WebView(html: "\(youtubeURL)\(serie.key)")
                }, label: {
                    
                    VStack(alignment: .leading) {
                        
                        // Displays the name of the videos.
                        Text(serie.name)
                            .foregroundColor(.red)
                        
                        // Displays the type of the videos.
                        Text(serie.type)
                            .foregroundColor(.red)
                            .font(.caption)
                        
                    }
                    
                })
                
            }
            
        }
        .onAppear {
            mediaModel.getSerieVideos(id: mediaID)
        }
        
    }
    
}

struct SerieVideosView_Previews: PreviewProvider {
    static var previews: some View {
        SerieVideosView(mediaModel: MediaModel(), mediaID: 92783)
    }
}
