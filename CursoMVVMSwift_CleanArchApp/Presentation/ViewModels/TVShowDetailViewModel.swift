//
//  TVShowDetailViewModel.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 20/1/25.
//

import Foundation

final class TVShowDetailViewModel: ObservableObject {
    @Published var details: TVShowDetails?
    var showId: Int = 0
    private let getShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol
    
    init(id: Int, getShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol = GetTVShowDetailsUseCase()) {
        self.showId = id
        self.getShowDetailsUseCase = getShowDetailsUseCase
    }
    
    func loadDetails(id: Int) async {
        do {
            let details = try await getShowDetailsUseCase.execute(id: id)
            
            await MainActor.run {
                self.details = details
            }
        } catch {
            print("Error: \(error)")
        }
        
    }
}
