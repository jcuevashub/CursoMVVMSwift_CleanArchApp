//
//  GetTVShowDetailsUseCaseProtocol.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

protocol GetTVShowDetailsUseCaseProtocol {
    func execute(id: Int) async throws -> TVShowDetails
}

final class GetTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol {
    private let repository: TVShowRepository
    
    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> TVShowDetails {
        try await repository.fetchTvShowDetails(id: id)
    }
}
