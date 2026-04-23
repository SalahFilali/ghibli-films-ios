//
//  ViewState.swift
//  GhibliFilms
//
//  Created by Salah Filali on 24/4/2026.
//

import Foundation

enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
}
