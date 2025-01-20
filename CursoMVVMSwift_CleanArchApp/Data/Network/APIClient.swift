//
//  APIClient.swift
//  CursoMVVMSwift_CleanArchApp
//
//  Created by Jackson Cuevas on 18/1/25.
//

import Foundation

final class APIClient {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYjBhYjYwNWE5Y2E2ODU5M2YzNjJmNGM2OTRiMDE2NSIsIm5iZiI6MTU4NzA5ODc5MS4yODEsInN1YiI6IjVlOTkzNGE3ZjY3ODdhMDAxNGYxZDBkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iMXRW391llC-Gp0-VoMiea3qeIDcTyNiMNYaqKV0ZpM"
        ]
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
        else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    }
}
