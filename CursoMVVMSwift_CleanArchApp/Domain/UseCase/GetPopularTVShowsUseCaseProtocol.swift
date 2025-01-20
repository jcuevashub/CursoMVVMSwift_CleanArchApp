//
//  GetPopularTVShowsUseCaseProtocol.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

protocol GetPopularTVShowsUseCaseProtocol {
    func execute() async throws -> [TVShow]
}

final class GetPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol {
    private let repository: TVShowRepository
    
    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute() async throws -> [TVShow] {
        return try await repository.fetchPopularTvShow()
    }
}
