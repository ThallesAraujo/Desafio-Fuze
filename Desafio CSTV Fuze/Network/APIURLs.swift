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
    case getTeam(Int)
    
    func request() throws -> URLRequest {
        switch self {
        case .getMatches:
            return createRequest(withURL: "\(baseURL)/matches")
        case let .getTeam(id):
            return createRequest(withURL: "\(baseURL)/teams?id=\(id)")
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
    
    private func createRequest(withURL url: String, queryParams: [URLQueryItem]) -> URLRequest{
        
        var url = URLComponents(string: url)!
        
        url.queryItems = queryParams
        
        
        var request = URLRequest(url: url.url!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
