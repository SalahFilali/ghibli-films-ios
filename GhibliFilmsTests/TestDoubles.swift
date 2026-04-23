//
//  TestDoubles.swift
//  GhibliFilmsTests
//
//  Created by Salah Filali on 24/4/2026.
//

import Foundation
@testable import GhibliFilms

final class APIClientMock: APIClientProtocol {
    private let result: Result<[FilmDTO], Error>
    private(set) var requestedURL: URL?

    init(result: Result<[FilmDTO], Error>) {
        self.result = result
    }

    func fetch<T>(_ type: T.Type, from url: URL) async throws -> T where T : Decodable {
        requestedURL = url

        switch result {
        case .success(let dtos):
            guard let typedResult = dtos as? T else {
                fatalError("Unexpected mock type requested")
            }
            return typedResult
        case .failure(let error):
            throw error
        }
    }
}

struct FilmsRepositoryMock: FilmsRepositoryProtocol {
    let result: Result<[Film], Error>

    func fetchFilms() async throws -> [Film] {
        try result.get()
    }
}

struct FilmsRepositoryDelayedMock: FilmsRepositoryProtocol {
    let result: Result<[Film], Error>
    let delayNanoseconds: UInt64

    func fetchFilms() async throws -> [Film] {
        try await Task.sleep(nanoseconds: delayNanoseconds)
        return try result.get()
    }
}

