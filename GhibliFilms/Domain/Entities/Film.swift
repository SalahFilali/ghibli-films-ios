//
//  Film.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import Foundation

struct Film: Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseYear: String
    let runningTime: String
    let rtScore: String
    let imageURL: URL?
    let bannerURL: URL?
}

