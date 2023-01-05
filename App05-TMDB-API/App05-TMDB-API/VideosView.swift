//
//  VideosView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 25/08/22.
//

import SwiftUI

struct VideosView: View {
    
    // Variable
    @ObservedObject var mediaModel: MediaModel
    var mediaID: Int
    
    var body: some View {
        
        List {
            
            // Displays the data of the "videos" array.
            ForEach(mediaModel.videos) { video in
                
                // Navigates to other link on click.
                NavigationLink(destination: {
                    WebView(html: "\(youtubeURL)\(video.key)")
                }, label: {
                    
                    VStack(alignment: .leading) {
                        
                        // Displays the name of the videos.
                        Text(video.name)
                            .foregroundColor(.red)
                        
                        // Displays the type of the videos.
                        Text(video.type)
                            .foregroundColor(.red)
                            .font(.caption)
                        
                    }
                    
                })
                
            }
            
        }
        .onAppear {
            mediaModel.getVideos(id: mediaID)
        }
        
    }
    
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView(mediaModel: MediaModel(), mediaID: 11111)
    }
}
