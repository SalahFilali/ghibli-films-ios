//
//  APIClientError.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import Foundation

enum APIClientError: LocalizedError, Equatable {
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError
    case networkError(String)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Réponse du serveur invalide."
        case .httpError(let statusCode):
            return "Erreur serveur (\(statusCode))."
        case .decodingError:
            return "Impossible de lire les données du serveur."
        case .networkError:
            return "Impossible de charger les films. Vérifiez votre connexion."
        }
    }
}
