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
    
    case getMatches(Int)
    case getTeam(Int)
    
    func request() throws -> URLRequest {
        switch self {
        case .getMatches(let page):
            return createRequest(withURL: "\(baseURL)/matches?page=\(page)")
        case let .getTeam(id):
            return createRequest(withURL: "\(baseURL)/teams?filter[id]=\(id)")
        }
    }
    
    private func createRequest(withURL url: String) -> URLRequest{
        
        let request = NSMutableURLRequest(url: URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
                                          ,cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request as URLRequest
    }
    
}
