//
//  FilmsRepository.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import Foundation

final class FilmsRepository: FilmsRepositoryProtocol {
    private let apiClient: APIClientProtocol
    private let filmsURL = URL(string: "https://ghibliapi.vercel.app/films")!

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchFilms() async throws -> [Film] {
        let dtos = try await apiClient.fetch([FilmDTO].self, from: filmsURL)
        return dtos.map(FilmDTOMapper.map)
    }
}
