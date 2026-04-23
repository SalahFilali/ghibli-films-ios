//
//  FilmDTOMapperTests.swift
//  GhibliFilmsTests
//
//  Created by Salah Filali on 24/4/2026.
//

import XCTest
@testable import GhibliFilms

final class FilmDTOMapperTests: XCTestCase {
    func test_map_createsDomainModelFromDTO() {
        let dto = FilmDTO(
            id: "1",
            title: "Mon voisin Totoro",
            description: "Une histoire magique.",
            director: "Hayao Miyazaki",
            producer: "Toru Hara",
            releaseDate: "1988",
            runningTime: "86",
            rtScore: "93",
            image: "https://example.com/poster.jpg",
            movieBanner: "https://example.com/banner.jpg"
        )

        let film = FilmDTOMapper.map(dto)

        XCTAssertEqual(film.id, "1")
        XCTAssertEqual(film.title, "Mon voisin Totoro")
        XCTAssertEqual(film.releaseYear, "1988")
        XCTAssertEqual(film.runningTime, "86")
        XCTAssertEqual(film.imageURL?.absoluteString, "https://example.com/poster.jpg")
        XCTAssertEqual(film.bannerURL?.absoluteString, "https://example.com/banner.jpg")
    }
}
