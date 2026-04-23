//
//  FilmsRepositoryProtocol.swift
//  GhibliFilms
//
//  Created by Salah Filali on 23/4/2026.
//

import Foundation

protocol FilmsRepositoryProtocol {
    func fetchFilms() async throws -> [Film]
}
