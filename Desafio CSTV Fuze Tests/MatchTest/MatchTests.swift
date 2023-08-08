//
//  MatchTests.swift
//  Desafio CSTV Fuze Tests
//
//  Created by Thalles Araújo on 08/08/23.
//

import Foundation
import XCTest
@testable import Desafio_CSTV_Fuze

final class MatchTests: XCTestCase{
    
    func testPastMatchesWithoutFlagForFiltering(){
        
        MatchStubs.mockMatchesResponse(responseType: .past)
        UserDefaults.standard.setValue(false, forKey: "enable_old_matches")
        
        let viewModel = HomeViewModel()
        
        let expectation = XCTestExpectation(description: "all conditions passed")
        
        viewModel.completion = {
            let firstResult = viewModel.matches?.first
            XCTAssertNil(firstResult)
            XCTAssertEqual(viewModel.matches?.count, 0)
            expectation.fulfill()
        }
        
        viewModel.getMatches()
        wait(for: [expectation], timeout: 10.0)
        
    }
    
    func testPastMatchesWithFlagForFiltering(){
        
        MatchStubs.mockMatchesResponse(responseType: .past)
        UserDefaults.standard.setValue(true, forKey: "enable_old_matches")
        
        let viewModel = HomeViewModel()
        
        let expectation = XCTestExpectation(description: "all conditions passed")
        
        viewModel.completion = {
            let firstResult = viewModel.matches?.first
            XCTAssertNotNil(firstResult)
            expectation.fulfill()
        }
        
        viewModel.getMatches()
        wait(for: [expectation], timeout: 10.0)
        
    }
    
    func testNewMatches(){
        MatchStubs.mockMatchesResponse(responseType: .future)
        UserDefaults.standard.setValue(false, forKey: "enable_old_matches")
        
        let viewModel = HomeViewModel()
        
        let expectation = XCTestExpectation(description: "all conditions passed")
        
        viewModel.completion = {
            let firstResult = viewModel.matches?.first
            XCTAssertNotNil(firstResult)
            expectation.fulfill()
        }
        
        viewModel.getMatches()
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    
}
