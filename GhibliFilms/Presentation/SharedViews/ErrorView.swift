//
//  ErrorView.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 36))
                .foregroundStyle(.orange)
                .accessibilityHidden(true)

            Text("Impossible de charger les films")
                .font(.title3.weight(.semibold))
                .multilineTextAlignment(.center)

            Text(message)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Button("Réessayer", action: retryAction)
                .buttonStyle(.borderedProminent)
                .accessibilityLabel("Réessayer le chargement des films")
                .accessibilityIdentifier("retry_button")
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("error_view")
    }
}

