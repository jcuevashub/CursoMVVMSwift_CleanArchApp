//
//  TvShowRepository.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

protocol TVShowRepository {
    func fetchPopularTvShow() async throws -> [TVShow]
    func fetchTvShowDetails(id: Int) async throws -> TVShowDetails
}
