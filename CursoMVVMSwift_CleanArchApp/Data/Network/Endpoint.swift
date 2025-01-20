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
        var path: String
        
        switch self {
        case .popularShows:
            path = "/tv/popular"
            return URL(string: "\(baseURLString)\(path)")!
        case .tvShowDetails(id: let id):
            path = "/tv/\(id)"
            return URL(string: "\(baseURLString)\(path)")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
