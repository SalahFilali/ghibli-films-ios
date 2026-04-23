//
//  FilmsListViewModel.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import Foundation
import Combine

@MainActor
final class FilmsListViewModel: ObservableObject {
    @Published private(set) var state: ViewState = .idle
    @Published private(set) var films: [Film] = []

    private let fetchFilmsUseCase: FetchFilmsUseCase

    init(fetchFilmsUseCase: FetchFilmsUseCase) {
        self.fetchFilmsUseCase = fetchFilmsUseCase
    }

    func loadFilms() async {
        state = .loading

        do {
            films = try await fetchFilmsUseCase.execute()
            state = .loaded
        } catch {
            films = []
            let message = (error as? LocalizedError)?.errorDescription ?? "Une erreur est survenue."
            state = .error(message)
        }
    }
}
