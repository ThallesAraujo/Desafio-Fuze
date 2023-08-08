//
//  DetailsTest.swift
//  Desafio CSTV Fuze Tests
//
//  Created by Thalles Araújo on 08/08/23.
//

import Foundation
import XCTest
@testable import Desafio_CSTV_Fuze

final class DetailsTests: XCTestCase{
    
    func testGetDetails(){
        let match = MatchesMockManager().getMatchesMock()
        DetailsStubs.mockDetailsResponse()
        
        let detailsViewModel = DetailsViewModel()
        
        detailsViewModel.completion = {
            let firstTeam = detailsViewModel.firstTeam
            XCTAssertNotNil(firstTeam)
        }
        
        detailsViewModel.getTeams(match: match)
        
    }
    
}
