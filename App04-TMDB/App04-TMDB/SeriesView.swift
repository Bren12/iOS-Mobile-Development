//
//  SeriesView.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct SeriesView: View {
    
    // Received parameter.
    @ObservedObject var mediaModel = MediaModel()
    
    var body: some View {
        
            NavigationView {
                
                VStack {
                    
                    TabView {
                        
                        // Displays the data of the "series" array.
                        ForEach(mediaModel.series) { serie in
                            
                            // Navigate to another screen with the
                            // selected serie.
                            NavigationLink {
                                SerieDetailView(serie: serie)
                            } label: {
                                // Display on screen the SerieRowView with the actual serie.
                                SerieRowView(serie: serie)
                            }
                            
                        }
                    
                    }
                    // Paged Scrolling TabView.
                    .tabViewStyle(.page)
                    
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
