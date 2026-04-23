//
//  FetchFilmsUseCase.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import Foundation

struct FetchFilmsUseCase {
    private let repository: FilmsRepositoryProtocol

    init(repository: FilmsRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Film] {
        try await repository.fetchFilms()
    }
}

