//
//  TVShow.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

struct PopularTVShowResponse: Codable {
    let results: [TVShow]
}

struct TVShow: Codable {
    let id: Int
    let name: String
    let first_air_date: String
    let vote_average: Double
}
