//
//  MatchStubs.swift
//  Desafio CSTV Fuze Tests
//
//  Created by Thalles Araújo on 08/08/23.
//

import Foundation
import OHHTTPStubs

@testable import Desafio_CSTV_Fuze

enum MatchResponseType: String{
    case past = "matches_past.json"
    case future = "matches_future.json"
}

class MatchStubs{
    
    static func mockMatchesResponse(responseType: MatchResponseType){
        
        stub(condition: isMethodGET()) { request in
            let stubPath = OHPathForFile(responseType.rawValue, MatchStubs.self)
            
            return HTTPStubsResponse(
                fileAtPath: stubPath!,
                statusCode: 200,
                headers:    stubsDefaultHeaders)
        }
    }
    
}
