//
//  FilmDTO.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import Foundation

struct FilmDTO: Decodable, Equatable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rtScore: String
    let image: String
    let movieBanner: String

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case director
        case producer
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
        case image
        case movieBanner = "movie_banner"
    }
}
