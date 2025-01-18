//
//  Endpoint.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
}

enum Endpoint {
    case popularShows
    case tvShowDetails(id: Int)
    
    var url: URL{
       let baseURLString = "https://api.themoviedb.org/3"
       let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYjBhYjYwNWE5Y2E2ODU5M2YzNjJmNGM2OTRiMDE2NSIsIm5iZiI6MTU4NzA5ODc5MS4yODEsInN1YiI6IjVlOTkzNGE3ZjY3ODdhMDAxNGYxZDBkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iMXRW391llC-Gp0-VoMiea3qeIDcTyNiMNYaqKV0ZpM"
        var path: String
        
        switch self {
        case .popularShows:
            path = "/tv/popular"
            return URL(string: "\(baseURLString)\(path)?api_key=\(apiKey)")!
        case .tvShowDetails(id: let id):
            path = "/tv/\(id)"
            return URL(string: "\(baseURLString)\(path)?api_key=\(apiKey)")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
