//
//  PopularShowsViewModel.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 20/1/25.
//

import Foundation

final class PopularShowsViewModel: ObservableObject {
    @Published var shows: [TVShow] = []
    private let getPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol
    
    init(getPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol = GetPopularTVShowsUseCase()) {
        self.getPopularTVShowsUseCase = getPopularTVShowsUseCase
    }
    
    func loadPopularShows() {
        Task {
            do {
                shows = try await getPopularTVShowsUseCase.execute()
            } catch {
                print("Error al cargar las series populares: \(error)")
            }
        }
    }
    
}
