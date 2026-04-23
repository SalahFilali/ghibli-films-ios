//
//  FilmRowView.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import SwiftUI

struct FilmRowView: View {
    let film: Film

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: film.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure, .empty:
                    ZStack {
                        Color.gray.opacity(0.15)
                        Image(systemName: "photo")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }
                @unknown default:
                    Color.gray.opacity(0.15)
                }
            }
            .frame(width: 88, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 8) {
                Text(film.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Réalisateur : \(film.director)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Sortie : \(film.releaseYear)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 0)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.04), radius: 8, x: 0, y: 4)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(film.title), réalisé par \(film.director), sorti en \(film.releaseYear)")
        .accessibilityHint("Ouvre le détail du film")
        .accessibilityIdentifier("film_row_\(film.id)")
    }
}

