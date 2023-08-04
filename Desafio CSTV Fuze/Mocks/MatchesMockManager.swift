//
//  MatchesMockManager.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import Foundation

class MatchesMockManager{
    
    func getMatchesMock() -> MatchResult?{
        
        if let path = Bundle(for: MatchesMockManager.self).path(forResource: "match", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                return try? decoder.decode(MatchResult.self, from: data)
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
        
    }
    
}
