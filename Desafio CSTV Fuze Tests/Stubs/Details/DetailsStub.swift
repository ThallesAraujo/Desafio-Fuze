//
//  DetailsStub.swift
//  Desafio CSTV Fuze Tests
//
//  Created by Thalles Araújo on 08/08/23.
//

import Foundation
import OHHTTPStubs

@testable import Desafio_CSTV_Fuze

class DetailsStubs{
    
    static func mockDetailsResponse(){
        
        stub(condition: isMethodGET()) { request in
            let stubPath = OHPathForFile("teams.json", DetailsStubs.self)
            
            return HTTPStubsResponse(
                fileAtPath: stubPath!,
                statusCode: 200,
                headers:    stubsDefaultHeaders)
        }
    }
    
}
