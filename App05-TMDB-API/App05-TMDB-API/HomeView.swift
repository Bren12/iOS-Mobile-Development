//
//  HomeView.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

struct HomeView: View {
    
    // Variable that store the media (movies/series).
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        
        TabView {
            // Display in screen the MoviesView.
            MoviesView(mediaModel: mediaModel)
                // Assign an icon to the Movies tab.
                .tabItem {
                    Label("Movies", systemImage: "film.fill")
                }
            // Display in screen the SeriesView.
            SeriesView(mediaModel: mediaModel)
                // Assign an icon to the Movies tab.
                .tabItem {
                    Label("Series", systemImage: "tv.fill")
                }
        }
        // Color of the icons
        .accentColor(.red)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
