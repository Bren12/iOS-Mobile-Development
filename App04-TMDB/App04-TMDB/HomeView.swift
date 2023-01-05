//
//  HomeView.swift
//  App04-TMDB
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
            MovieView(mediaModel: mediaModel)
                // Assign an icon to the Movies tab.
                .tabItem {
                    Label("Movies", systemImage: "film.fill")
                }
            // Display in screen the SeriesView.
            SeriesView(mediaModel: mediaModel)
                // Assign an icon to the Series tab.
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
