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
        List(viewModel.shows, id: \.id) {show in
            Text(show.name)
        }
        .onAppear {
            Task {
                viewModel.loadPopularShows()
            }
        }
    }
}

#Preview {
    PopularShowView()
}
