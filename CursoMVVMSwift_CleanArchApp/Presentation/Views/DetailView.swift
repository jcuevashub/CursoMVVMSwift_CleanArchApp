//
//  DetailView.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 20/1/25.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: TVShowDetailViewModel
    
    init(viewModel: TVShowDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let details = viewModel.details {
                Text(details.name)
                    .font(.headline)
                    .padding(.bottom, 20)
                Text(details.overview)
                if !details.genres.isEmpty {
                    Text("Generos:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(details.genres) {genre in
                        Text(genre.name)
                    }
                }
            } else {
                Text("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }.onAppear {
            Task {
                await viewModel.loadDetails(id: viewModel.showId)
            }
        }
    }
}

#Preview {
//    DetailView()
}
