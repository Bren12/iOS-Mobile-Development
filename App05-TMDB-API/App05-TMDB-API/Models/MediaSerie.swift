//
//  MediaSerie.swift
//  App05-TMDB-API
//
//  Created by Brenda Saucedo on 27/08/22.
//

import SwiftUI

struct MediaSerie: Identifiable {
    var id: Int
    var name: String
    var first_air_date: String
    var genres: [String]
    var overview: String
    var vote_average: Double
    var poster_path: String
    var backdrop_path: String
}
