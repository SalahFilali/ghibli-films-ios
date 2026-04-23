//
//  APIClient.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import Foundation

final class APIClient: APIClientProtocol {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func fetch<T: Decodable & Sendable>(_ type: T.Type, from url: URL) async throws -> T {
        do {
            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIClientError.invalidResponse
            }

            guard 200...299 ~= httpResponse.statusCode else {
                throw APIClientError.httpError(statusCode: httpResponse.statusCode)
            }

            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw APIClientError.decodingError
            }
        } catch let error as APIClientError {
            throw error
        } catch {
            throw APIClientError.networkError(error.localizedDescription)
        }
    }
}
