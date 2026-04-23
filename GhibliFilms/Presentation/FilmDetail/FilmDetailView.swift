//
//  FilmDetailView.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film

    private let metadataColumns = [
        GridItem(.adaptive(minimum: 140), spacing: 12, alignment: .top)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                heroImage

                VStack(alignment: .leading, spacing: 12) {
                    Text(film.title)
                        .font(.largeTitle.bold())
                        .fixedSize(horizontal: false, vertical: true)

                    metadataSection

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.title3.weight(.semibold))

                        Text(film.description)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(film.title)
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityIdentifier("film_detail_view")
    }

    private var heroImage: some View {
        AsyncImage(url: film.bannerURL ?? film.imageURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure, .empty:
                ZStack {
                    LinearGradient(
                        colors: [Color.gray.opacity(0.25), Color.gray.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    Image(systemName: "film")
                        .font(.system(size: 42))
                        .foregroundStyle(.secondary)
                }
            @unknown default:
                Color.gray.opacity(0.15)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
        .clipped()
        .accessibilityLabel("Affiche du film \(film.title)")
        .accessibilityIdentifier("film_hero_image")
    }

    private var metadataSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Informations")
                .font(.title3.weight(.semibold))

            LazyVGrid(columns: metadataColumns, alignment: .leading, spacing: 12) {
                metadataCard(title: "Réalisateur", value: film.director)
                metadataCard(title: "Producteur", value: film.producer)
                metadataCard(title: "Sortie", value: film.releaseYear)
                metadataCard(title: "Durée", value: "\(film.runningTime) min")
                metadataCard(title: "Score", value: film.rtScore)
            }
        }
    }

    private func metadataCard(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            Text(value)
                .font(.body.weight(.medium))
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title) : \(value)")
    }
}

