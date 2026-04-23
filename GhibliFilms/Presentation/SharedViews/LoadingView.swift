//
//  LoadingView.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .controlSize(.large)
            Text("Chargement des films...")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Chargement des films")
        .accessibilityIdentifier("loading_view")
    }
}

