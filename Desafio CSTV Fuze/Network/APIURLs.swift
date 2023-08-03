//
//  APIURLs.swift
//  DesafioGloboplay
//
//  Created by Thalles Araújo on 26/07/23.
//

import Foundation

let baseURL = "https://api.pandascore.co/csgo"

let headers = [
  "accept": "application/json",
  "Authorization": "Bearer \(pandaScoreToken)"
]

enum APIURLs{
    
    case getMatches
    
    func request() throws -> URLRequest {
        switch self {
        case .getMatches:
            return createRequest(withURL: "\(baseURL)/matches")
        }
    }
    
    private func createRequest(withURL url: String) -> URLRequest{
        var request = URLRequest(url: URL.init(string: url)!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
