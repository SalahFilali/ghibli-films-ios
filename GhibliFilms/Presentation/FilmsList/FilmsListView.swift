//
//  FilmsListView.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import SwiftUI

struct FilmsListView: View {
    @StateObject private var viewModel: FilmsListViewModel

    init(viewModel: FilmsListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    LoadingView()

                case .loaded:
                    filmsList

                case .error(let message):
                    ErrorView(message: message) {
                        Task {
                            await viewModel.loadFilms()
                        }
                    }
                }
            }
            .navigationTitle("Films Ghibli")
            .background(Color(.systemGroupedBackground))
        }
        .task {
            guard viewModel.state == .idle else { return }
            await viewModel.loadFilms()
        }
    }

    private var filmsList: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.films) { film in
                        FilmRowView(film: film)
                    .buttonStyle(.plain)
                    .accessibilityIdentifier("film_link_\(film.id)")
                }
            }
            .padding(16)
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemGroupedBackground))
        
    }
}

