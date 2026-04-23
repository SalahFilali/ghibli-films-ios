//
//  FilmsListViewModelTests.swift
//  GhibliFilmsTests
//
//  Created by Salah Filali on 24/4/2026.
//

import XCTest
@testable import GhibliFilms

@MainActor
final class FilmsListViewModelTests: XCTestCase {
    func test_loadFilms_setsLoadedStateOnSuccess() async {
        let expectedFilms = [
            Film(
                id: "1",
                title: "Le Voyage de Chihiro",
                description: "Description",
                director: "Hayao Miyazaki",
                producer: "Toshio Suzuki",
                releaseYear: "2001",
                runningTime: "125",
                rtScore: "97",
                imageURL: nil,
                bannerURL: nil
            )
        ]
        let viewModel = FilmsListViewModel(
            fetchFilmsUseCase: FetchFilmsUseCase(
                repository: FilmsRepositoryMock(result: .success(expectedFilms))
            )
        )

        await viewModel.loadFilms()

        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssertEqual(viewModel.films, expectedFilms)
    }

    func test_loadFilms_setsErrorStateOnFailure() async {
        let viewModel = FilmsListViewModel(
            fetchFilmsUseCase: FetchFilmsUseCase(
                repository: FilmsRepositoryMock(result: .failure(APIClientError.decodingError))
            )
        )

        await viewModel.loadFilms()

        XCTAssertEqual(viewModel.films, [])
        XCTAssertEqual(viewModel.state, .error("Impossible de lire les données du serveur."))
    }

    func test_loadFilms_transitionsThroughLoadingState() async {
        let repository = FilmsRepositoryDelayedMock(
            result: .success([]),
            delayNanoseconds: 200_000_000
        )
        let viewModel = FilmsListViewModel(
            fetchFilmsUseCase: FetchFilmsUseCase(repository: repository)
        )

        let task = Task {
            await viewModel.loadFilms()
        }

        await Task.yield()

        XCTAssertEqual(viewModel.state, .loading)

        await task.value
        XCTAssertEqual(viewModel.state, .loaded)
    }
}
