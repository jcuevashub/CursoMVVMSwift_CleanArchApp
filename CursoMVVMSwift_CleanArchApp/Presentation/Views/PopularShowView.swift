//
//  PopularShowView.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 20/1/25.
//

import SwiftUI

struct PopularShowView: View {
    @StateObject private var viewModel = PopularShowsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.shows, id: \.id) {show in
                NavigationLink(
                    destination: DetailView(viewModel: TVShowDetailViewModel(id: show.id))) {
                        Text(show.name)
                    }
            }
            .onAppear {
                Task {
                    viewModel.loadPopularShows()
                }
            }
        }
    }
}

#Preview {
    PopularShowView()
}
