//
//  TVShowDetails.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
}

struct TVShowDetails: Codable {
    let name: String
    let genres: [Genre]
    let overview: String
}
