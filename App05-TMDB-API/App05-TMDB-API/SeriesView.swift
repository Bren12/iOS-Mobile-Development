//
//  SeriesView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct SeriesView: View {
    
    // Received parameter.
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // Verify if there are series in the array.
                if mediaModel.series.count > 0 {
                    
                    TabView {
                        
                        // Displays the data of the "series" array.
                        ForEach(mediaModel.series) { serie in
                            
                            // Navigate to another screen with the
                            // selected movie.
                            NavigationLink {
                                SerieDetailView(mediaModel: mediaModel, media: serie)
                            } label: {
                                // Display on screen the MovieRowView with the actual movie.
                                SerieRowView(media: serie)
                            }
                            
                        }
                        
                    }
                    // Paged Scrolling TabView.
                    .tabViewStyle(.page)
                    
                } else {
                    // On the other case, there are no series to display.
                    Text("No hay series")
                }
                
            }
            // Headline
            .navigationTitle("Series")
            // Position
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
