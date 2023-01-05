//
//  MediaModel.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 18/08/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class MediaModel: ObservableObject {
    
    // Variables for media
    @Published var movies = [Media]()
    @Published var series = [MediaSerie]()
    // Variables for the media's genres
    @Published var genresMovies = [Genre]()
    @Published var genresSeries = [Genre]()
    // Variables for videos' media
    @Published var videos = [Video]()
    @Published var videosSerie = [Video]()
    
    // Initializer
    init() {
        LoadData()
    }
    
    // Load the info of the genres of the media.
    func LoadData() {
        
        // Deletes all the data contained in the arrays.
        genresMovies.removeAll()
        genresSeries.removeAll()
        
        // URLs taht contains the genre data of the media.
        let URL = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apikey)&language=en-US"
        let URL2 = "https://api.themoviedb.org/3/genre/tv/list?api_key=\(apikey)&language=en-US"
        
        // Request the genres of the movies.
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for genre in json["genres"] {
                let g = Genre(
                    id: genre.1["id"].intValue,
                    name: genre.1["name"].stringValue
                )
                self.genresMovies.append(g)
            }
            // Call to load the info of the movies.
            self.LoadMovies()
        }
        
        // Request the genres of the series.
        AF.request(URL2, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for genre2 in json["genres"] {
                let g2 = Genre(
                    id: genre2.1["id"].intValue,
                    name: genre2.1["name"].stringValue
                )
                self.genresSeries.append(g2)
            }
            // Call to load the info of the series.
            self.LoadSeries()
        }
        
    }
    
    // Load the info of the movies.
    func LoadMovies() {
        
        // Deletes all the data contained in the array.
        movies.removeAll()
        
        // URL taht contains the data of the movies.
        let URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
        // Request the data of the movies.
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for result in json["results"] {
                var genres = [String]()
                for genreInt in result.1["genre_ids"] {
                    if let genreName = self.genresMovies.first(where: {$0.id == genreInt.1.intValue}) {
                        genres.append(genreName.name)
                    }
                }
                let media: Media = Media(id: result.1["id"].intValue,
                              title: result.1["title"].stringValue,
                              release_date: result.1["release_date"].stringValue,
                              adult: result.1["adult"].boolValue,
                              genres: genres,
                              overview: result.1["overview"].stringValue,
                              vote_average: result.1["vote_average"].doubleValue * 10,
                              poster_path: "\(imageURL)\(result.1["poster_path"].stringValue)",
                              backdrop_path: "\(imageURL)\(result.1["backdrop_path"].stringValue)")
                self.movies.append(media)
            }
        }
        
    }
    
    // Load the info of the series.
    func LoadSeries() {
        
        // Deletes all the data contained in the array.
        series.removeAll()
        
        // URL taht contains the data of the series.
        let URL = "https://api.themoviedb.org/3/tv/popular?api_key=\(apikey)&language=en-US"
        
        // Request the data of the series.
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for result in json["results"] {
                var genres = [String]()
                for genreInt in result.1["genre_ids"] {
                    if let genreName = self.genresSeries.first(where: {$0.id == genreInt.1.intValue}) {
                        genres.append(genreName.name)
                    }
                }
                let media: MediaSerie = MediaSerie(id: result.1["id"].intValue,
                              name: result.1["name"].stringValue,
                              first_air_date: result.1["first_air_date"].stringValue,
                              genres: genres,
                              overview: result.1["overview"].stringValue,
                              vote_average: result.1["vote_average"].doubleValue * 10,
                              poster_path: "\(imageURL)\(result.1["poster_path"].stringValue)",
                              backdrop_path: "\(imageURL)\(result.1["backdrop_path"].stringValue)")
                self.series.append(media)
            }
        }
        
    }
    
    // Load the info of the videos of the movies.
    func getVideos(id: Int) {
        
        // Deletes all the data contained in the array.
        videos.removeAll()
    
        // URL taht contains the data of the videos of the movies.
        let URL = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apikey)&language=en-US"
        
        // Request the data of the videos.
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for result in json["results"] {
                let video = Video(
                    id: result.1["id"].stringValue,
                    name: result.1["name"].stringValue,
                    key: result.1["key"].stringValue,
                    site: result.1["site"].stringValue,
                    type: result.1["type"].stringValue)
                self.videos.append(video)
            }
        }
        
    }
    
    // Load the info of the videos of the series.
    func getSerieVideos(id: Int) {
        
        // Deletes all the data contained in the array.
        videosSerie.removeAll()
        
        // URL that contains the data of the videos of the series.
        let URL = "https://api.themoviedb.org/3/tv/\(id)/videos?api_key=\(apikey)&language=en-US"
        
        // Request the data of the videos.
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
            let json = try! JSON(data: data.data!)
            for result in json["results"] {
                let video = Video(
                    id: result.1["id"].stringValue,
                    name: result.1["name"].stringValue,
                    key: result.1["key"].stringValue,
                    site: result.1["site"].stringValue,
                    type: result.1["type"].stringValue)
                self.videosSerie.append(video)
            }
        }
        
    }
    
}
