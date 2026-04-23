//
//  FilmsRepositoryTests.swift
//  GhibliFilmsTests
//
//  Created by Salah Filali on 24/4/2026.
//

import XCTest
@testable import GhibliFilms

final class FilmsRepositoryTests: XCTestCase {
    func test_fetchFilms_returnsMappedFilms() async throws {
        let apiClient = APIClientMock(result: .success([
            FilmDTO(
                id: "1",
                title: "Ponyo",
                description: "Description",
                director: "Hayao Miyazaki",
                producer: "Toshio Suzuki",
                releaseDate: "2008",
                runningTime: "100",
                rtScore: "92",
                image: "https://example.com/poster.jpg",
                movieBanner: "https://example.com/banner.jpg"
            )
        ]))
        let repository = FilmsRepository(apiClient: apiClient)

        let films = try await repository.fetchFilms()

        XCTAssertEqual(apiClient.requestedURL?.absoluteString, "https://ghibliapi.vercel.app/films")
        XCTAssertEqual(films.count, 1)
        XCTAssertEqual(films.first?.title, "Ponyo")
        XCTAssertEqual(films.first?.director, "Hayao Miyazaki")
    }

    func test_fetchFilms_propagatesError() async {
        let apiClient = APIClientMock(result: .failure(APIClientError.httpError(statusCode: 500)))
        let repository = FilmsRepository(apiClient: apiClient)

        do {
            _ = try await repository.fetchFilms()
            XCTFail("Expected fetchFilms to throw")
        } catch {
            XCTAssertEqual(error as? APIClientError, .httpError(statusCode: 500))
        }
    }
}
