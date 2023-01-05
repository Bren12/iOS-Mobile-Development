//
//  MediaModel.swift
//  App04-TMDB
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI

class MediaModel: ObservableObject {
    
    // Variable for movies
    @Published var movies = [Media]()
    // Variable for series
    @Published var series = [Media]()
    
    // Initializer
    init() {
        LoadInfo()
    }
    
    // Load the info of the movies and series.
    func LoadInfo() {
        
        // Variable for the media (movies/series).
        var media: Media
        
        // Assign a movie to the variable "media".
        media = Media(name: "The Tomorrow War ", year: 2021, rated: .PG13, genre: ["Action", "Science Fiction", "Adventure"], duration: "2h 18m", headline: "The fight for tomorrow begins today.", overview: "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.", score: 78, images: ["TheTomorrowWar1","TheTomorrowWar2","TheTomorrowWar3","TheTomorrowWar4","TheTomorrowWar5"], trailer: "https://youtu.be/RQjEbkV-9ZM")
        
        // Append the value of media to movies.
        movies.append(media)
        
        // Assign a movie to the variable "media".
        media = Media(name: "Shang-Chi and the Legend of the Ten Rings ", year: 2021, rated: .PG13, genre: ["Action", "Adventure", "Fantasy"], duration: "2h 12m", headline: "You can't outrun your destiny.", overview: "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.", score: 80, images: ["Shang-Chi1","Shang-Chi2","Shang-Chi3","Shang-Chi4","Shang-Chi5"], trailer: "https://youtu.be/8YjFbMbfXaQ")
        
        // Append the value of media to movies.
        movies.append(media)
        
        // Assign a movie to the variable "media"
        media = Media(name: "Luca ", year: 2021, rated: .PG, genre: ["Animation", "Comedy", "Family", "Fantasy"], duration: "1h 35m", headline: "", overview: "Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-held secret: they are sea monsters from another world just below the water’s surface.", score: 81, images: ["Luca1","Luca2","Luca3","Luca4","Luca5"], trailer: "https://youtu.be/mYfJxlgR2jw")
        
        // Append the value of media to movies.
        movies.append(media)
        
        // Assign a serie to the variable "media".
        media = Media(name: "Friends ", year: 1994, rated: .TV14, genre: ["Comedy", "Drama"], duration: "25m", headline: "I'll be there for you", overview: "The misadventures of a group of friends as they navigate the pitfalls of work, life and love in Manhattan.", score: 84, images: ["Friends1","Friends2","Friends3","Friends4","Friends5"], trailer: "https://youtu.be/hDNNmeeJs1Q")
        
        // Append the value of media to series.
        series.append(media)
        
        // Assign a serie to the variable "media".
        media = Media(name: "WandaVision ", year: 2021, rated: .TV14, genre: ["Sci-Fi & Fantasy", "Mystery", "Drama"], duration: "36m", headline: "Experience a new vision of reality.", overview: "Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.", score: 85, images: ["WandaVision1","WandaVision2","WandaVision3","WandaVision4","WandaVision5"], trailer: "https://youtu.be/sj9J2ecsSpo")
        
        // Append the value of media to series.
        series.append(media)
        
        // Assign a serie to the variable "media".
        media = Media(name: "The Mandalorian ", year: 2019, rated: .TV14, genre: ["Sci-Fi & Fantasy", "Action & Adventure", "Western", "Drama"], duration: "35m", headline: "Bounty hunting is a complicated profession.", overview: "After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.", score: 85, images: ["TheMandalorian1","TheMandalorian2","TheMandalorian3","TheMandalorian4","TheMandalorian5"], trailer: "https://youtu.be/eW7Twd85m2g")
        
        // Append the value of media to series.
        series.append(media)
        
    }
    
}
