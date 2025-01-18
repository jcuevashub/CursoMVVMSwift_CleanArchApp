//
//  TVShowRepositoryImpl.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

final class TVShowRepositoryImpl: TVShowRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchPopularTvShow() async throws -> [TVShow] {
        let response: PopularTVShowResponse = try await apiClient.request(endpoint: .popularShows)
        return response.results
    }
    
    func fetchTvShowDetails(id: Int) async throws -> TVShowDetails {
        try await apiClient.request(endpoint: .tvShowDetails(id: id))
    }
    
    
}
