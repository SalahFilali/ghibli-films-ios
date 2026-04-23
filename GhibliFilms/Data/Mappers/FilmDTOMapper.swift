//
//  FilmDTOMapper.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import Foundation

enum FilmDTOMapper {
    static func map(_ dto: FilmDTO) -> Film {
        Film(
            id: dto.id,
            title: dto.title,
            description: dto.description,
            director: dto.director,
            producer: dto.producer,
            releaseYear: dto.releaseDate,
            runningTime: dto.runningTime,
            rtScore: dto.rtScore,
            imageURL: URL(string: dto.image),
            bannerURL: URL(string: dto.movieBanner)
        )
    }
}
