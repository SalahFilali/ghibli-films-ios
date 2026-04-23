//
//  GhibliFilmsApp.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import SwiftUI

@main
struct GhibliFilmsApp: App {
    private let container = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            FilmsListView(viewModel: FilmsListViewModel(
                fetchFilmsUseCase: container.makeFetchFilmsUseCase()
                )
            )
        }
    }
}
