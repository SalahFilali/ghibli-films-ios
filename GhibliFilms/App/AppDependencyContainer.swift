//
//  AppDependencyContainer.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import Foundation

struct AppDependencyContainer {
    func makeAPIClient() -> APIClientProtocol {
        APIClient()
    }

    func makeFilmsRepository() -> FilmsRepositoryProtocol {
        FilmsRepository(apiClient: makeAPIClient())
    }

    func makeFetchFilmsUseCase() -> FetchFilmsUseCase {
        FetchFilmsUseCase(repository: makeFilmsRepository())
    }
}
